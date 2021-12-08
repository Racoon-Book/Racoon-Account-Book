import Foundation
import SwiftDate
import SwiftSpeech
import SwiftUI

struct ButtonContent: View {
    @Environment(\.swiftSpeechState) var state: SwiftSpeech.State

    private static let addButtonSize = CGFloat(59)

    var scale: CGFloat {
        switch state {
        case .pending:
            return 1.0
        case .recording:
            return 1.5
        case .cancelling:
            return 1.2
        }
    }

    var buttonIcon: String {
        switch state {
        case .pending:
            return "plus"
        default:
            return "mic.fill"
        }
    }

    var body: some View {
        ZStack {
            Circle()
                .fill(defaultColorSet.addButton)
                .frame(
                    width: ButtonContent.addButtonSize,
                    height: ButtonContent.addButtonSize
                )
                .shadow(color: defaultColorSet.addButton,
                        radius: 5)
            Text(Image(systemName: buttonIcon))
                .foregroundColor(.white)
                .bold()
                .font(.system(size: ButtonContent.addButtonSize * 0.6))
        }
        .scaleEffect(scale)
    }
}

struct FloatingAddButton: View {
    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel

    @Binding var expenseInfo_inputting: ExpenseInfo

    @State var recognizedText: String = "" // （自用）动态识别出的结果

    var body: some View {
        ZStack {
            HStack {
                // 用Spacer()将加好怼到最右边
                Spacer()
                VStack {
                    Spacer()
                    ButtonContent()
                        .swiftSpeechRecordOnHoldWithTap(locale: Locale(identifier: ChineseSpeechIdentifier), tapAction: {
                            print(Log().string + "Tapped")
                            RacoonSheetConfig.showCreateSheet()
                        }, tapDuration: 80)
                        .onStartRecording { _ in
                            withAnimation { RacoonSheetConfig.shared.blurRadius = 4.0 }
                            RacoonSheetConfig.shared.showingVoiceInputView = true
                        }
                        .printRecognizedText(includePartialResults: true)
                        .onRecognizeLatest(update: $recognizedText)
                        .padding([.horizontal], 25) // 远离右边
                        .padding([.vertical], 80) // 远离下边 因为有安全区，所以这个值比右边大一些
                }
            }

            // 悬浮在所有界面之上的语音识别界面 所以在ZStack最下方
            if RacoonSheetConfig.shared.showingVoiceInputView {
                VoiceInputView(
                    recognizedText: $recognizedText)
            }
        }
        .onAppear {
            // 获取SwiftSpeech录音和语音识别的权限
            // 按钮一出现就申请权限 -- 申请过了就不会再出现了。没有这个权限 SwiftSpeech 相关的 View 出不来
            SwiftSpeech.requestSpeechRecognitionAuthorization()
            // TODO: 如果用户不给权限可能需要加一些处理
        }
    }
}

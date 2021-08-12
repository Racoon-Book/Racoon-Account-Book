import Foundation
import SwiftDate
import SwiftSpeech
import SwiftUI

struct FloatingAddButton: View {
    private static let addButtonSize = CGFloat(50)

    @Binding var addUIConfig: AddUIConfig
    @Binding var metadata_inputting: MetaItem

    @State var recognizedText: String = "" // （自用）动态识别出的结果

    var body: some View {
        ZStack {
            HStack {
                // 用Spacer()将加好怼到最右边
                Spacer()
                VStack {
                    Spacer()
                    Button(action: {},
                           label: {
                               ZStack {
                                   Circle()
                                       .fill(Color.yellow)
                                       .frame(
                                           width: FloatingAddButton.addButtonSize,
                                           height: FloatingAddButton.addButtonSize)
                                   Text(Image(systemName: "plus"))
                                       .foregroundColor(.black)
                                       .bold()
                                       .font(.system(size: FloatingAddButton.addButtonSize * 0.75))
                               }
                           })
                        .swiftSpeechRecordOnHold(locale: Locale(identifier: ChineseSpeechIdentifier))
                        .simultaneousGesture(TapGesture().onEnded {
                            printLog("[FloatAddButton] Tapped")
                            addUIConfig.isShowingOrdinaryAddView = true

                            // Tap 会触发 onStartRecording，手动还原
                            addUIConfig.blurRadius = 0
                            addUIConfig.isShowingVoiceInputView = false

                            // TODO: 在语音输入下误触（Tap）本按钮
                        })
                        .onStartRecording { _ in
                            addUIConfig.blurRadius = 4.0
                            addUIConfig.isShowingVoiceInputView = true
                        }
                        .printRecognizedText(includePartialResults: true)
                        .onRecognizeLatest(update: $recognizedText)
                        .padding([.horizontal], 25) // 远离右边
                        .padding([.vertical], 80) // 远离下边 因为有安全区，所以这个值比右边大一些
                        .shadow(radius: 7)
                }
            }

            // 悬浮在所有界面之上的语音识别界面 所以在ZStack最下方
            if addUIConfig.isShowingVoiceInputView {
                VoiceInputView(addUIConfig: $addUIConfig,
                               metadata_inputting: $metadata_inputting,
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

struct FloatingAddButton_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        FloatingAddButton(addUIConfig: .constant(
            AddUIConfig(
                isShowingOrdinaryAddView: false,
                isShowingVoiceInputView: false)),
        metadata_inputting: .constant(MetaItem(
            originalText: "",
            spentMoneyAt: DateInRegion(region: regionChina),
            event: "买饮料",
            amount_float: 3.5)))
            .environmentObject(PreviewAccountBook)

        MainView()
            .environmentObject(PreviewAccountBook)
    }
}

import SwiftDate
import SwiftSpeech
import SwiftUI

struct VoiceInputView: View {
    @Binding var addUIConfig: AddUIConfig
    @Binding var metadata_inputting: MetaItem

    @State private var recognizedText: String = "" // （自用）动态识别出的结果

    var body: some View {
        ZStack {
            // [暗淡背景]
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.black)
                .opacity(0.5)

            VStack {
                // 实时显示语音识别结果
                // TODO: 这里可以改成TextFiekd 这样用户看到错别字就可以直接修改
                Text(recognizedText)
                    .font(.system(.title))

                HStack {
                    // 清除按钮
                    ClearSpeechButton(recognizedText: $recognizedText)
                    // 按住输入语音按钮
                    SwiftSpeech.RecordButton()
                        .font(.system(.title))
                        .swiftSpeechRecordOnHold(locale: Locale(identifier: ChineseSpeechIdentifier))
                        .onRecognizeLatest(update: $recognizedText)
                    // 确定语音输入没问题 提交
                    CommitSpeechButton(addUIConfig: $addUIConfig,
                                       metadata_inputting: $metadata_inputting,
                                       recognizedText: $recognizedText)
                }

                // 提示
                Text("按住来录入")
                    .font(.system(.title))

                // 关闭语音输入
                Button {
                    // 除了关闭VoiceInputView什么都不用做
                    addUIConfig.isShowingVoiceInputView = false
                } label: {
                    Text(Image(systemName: "xmark"))
                        .font(.system(.title))
                }
            }
        }
        .onAppear {
            SwiftSpeech.requestSpeechRecognitionAuthorization() // 获取SwiftSpeech录音和语音识别的权限
            // TODO: 如果用户不给权限可能需要加一些处理
        }
    }
}

struct ClearSpeechButton: View {
    @Binding var recognizedText: String

    var body: some View {
        Button(action: {
            printLog("[ClearSpeechButton] Clicked.")
            withAnimation {
                recognizedText = ""
            }
        }, label: {
            Text(Image(systemName: "arrow.counterclockwise"))
                .font(.system(.title))
        })
    }
}

struct CommitSpeechButton: View {
    @Binding var addUIConfig: AddUIConfig
    @Binding var metadata_inputting: MetaItem

    @Binding var recognizedText: String // （自用）用来动态显示识别结果

    var body: some View {
        Button(action: {
            printLog("[CommitSpeechButton] Clicked.")
            metadata_inputting.originalText = recognizedText // 将结果传给 OrdinaryAddSheet

            UpdateMetaItem()

            withAnimation { // TODO: 不太清楚这个动画有没有作用
                addUIConfig.isShowingVoiceInputView = false // 提交之后收起语音添加界面
                addUIConfig.isShowingOrdinaryAddView = true // 呈现 OrdinaryAddSheet
            }
            recognizedText = ""
        }, label: {
            Text(Image(systemName: "checkmark"))
                .font(.system(.title))
        })
    }

    private func UpdateMetaItem() {
        metadata_inputting.update(
            event: OriginalText2Event(from: metadata_inputting.originalText ?? "") ?? "",
            amount_float: OriginalText2Amount(from: metadata_inputting.originalText ?? "") ?? 0.0,
            generatedTags: OriginalText2GeneratedTags(from: metadata_inputting.originalText ?? ""))
    }
}

struct VoiceInputView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        VoiceInputView(
            addUIConfig: .constant(
                AddUIConfig(
                    isShowingOrdinaryAddView: false,
                    isShowingVoiceInputView: true
                )
            ),
            metadata_inputting: .constant(
                MetaItem(
                    originalText: "",
                    spentMoneyAt: DateInRegion(),
                    event: "买饮料",
                    amount_float: 3.5
                )
            )
        )
    }
}

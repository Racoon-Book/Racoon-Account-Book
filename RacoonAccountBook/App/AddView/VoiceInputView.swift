import SwiftDate
import SwiftSpeech
import SwiftUI

struct VoiceInputView: View {
    @Binding var addUIConfig: AddUIConfig
    @Binding var metadata_inputting: MetaItem
    @Binding var recognizedText: String

    var body: some View {
        GeometryReader { geo in
            // ZStack 用于将 GeometryReader 内部元素居中：https://stackoverflow.com/a/64125081
            ZStack {
                VStack {
                    Spacer(minLength: geo.size.height * 0.55)

                    // 提示，当存在已识别文本时显示语音识别结果
                    Text(recognizedText == "" ? "长按添加按钮来录入" : recognizedText)
                        .font(.system(.title))
                        .padding(.vertical, 15.0)

                    // 提交、关闭按钮
                    HStack {
                        Spacer()
                        Button {
                            addUIConfig.blurRadius = 0 // 取消模糊
                            addUIConfig.isShowingVoiceInputView = false // 关闭VoiceInputView
                            recognizedText = "" // 清除已识别文字
                        } label: {
                            Text(Image(systemName: "xmark"))
                                .font(.system(.title))
                        }
                        Spacer()
                        // 确定语音输入没问题 提交
                        CommitSpeechButton(addUIConfig: $addUIConfig,
                                           metadata_inputting: $metadata_inputting,
                                           recognizedText: $recognizedText)
                        Spacer()
                    }
                    .padding(.vertical, 15.0)

                    Spacer()
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
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
                addUIConfig.blurRadius = 0 // 取消模糊
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
            generatedTags: OriginalText2GeneratedTags(from: metadata_inputting.originalText ?? "")
        )
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
                    spentMoneyAt: DateInRegion(region: regionChina),
                    event: "买饮料",
                    amount_float: 3.5
                )
            ),
            recognizedText: .constant("")
        )
    }
}

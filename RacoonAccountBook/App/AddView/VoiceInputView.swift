import SwiftSpeech
import SwiftUI

struct VoiceInputView: View {
    @Binding var isShowing: Bool // FIXME: 需要在显示之后将这个值改为false 比如在说完点击按钮后修改值
    var body: some View {
        ZStack {
            // TODO: 这里自己写样式 还要把背景暗淡下来 用不透明度
            SwiftSpeech.Demos.Basic(localeIdentifier: ChineseSpeechIdentifier)
        }
        .onAppear {
            SwiftSpeech.requestSpeechRecognitionAuthorization()
        }
    }
}

struct VoiceInputView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceInputView(isShowing: .constant(true))
    }
}

import Combine
import SwiftUI

struct StoryField: View {
    @Binding var metadata_inputting: MetaItem

    var hint: String = ""

    @State private var text: String = ""

    var body: some View {
        TextField(
            hint,
            text: $text) { _ in }
        onCommit: {
            printLog("[StoryField] Committed.")
            UpdateStory()
        }
        // Check https://stackoverflow.com/a/63694929/14298786
        // 解决用户可能在输入之后不按键盘上的回车直接点击添加按钮而未添加的问题
        .onReceive(Just(text)) { _ in
            printLog("[StoryField] Changed.")
            UpdateStory()
        }
        .autocapitalization(.none)
        .disableAutocorrection(false)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }

    private func UpdateStory() {
        if metadata_inputting.story == nil {
            metadata_inputting.story = MetaItem.Story(rating: nil, emoji: nil, text: text)
        } else {
            metadata_inputting.story!.update(text: text)
        }
    }
}

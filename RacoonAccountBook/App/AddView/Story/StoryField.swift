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
            if metadata_inputting.story == nil {
                metadata_inputting.story = MetaItem.Story(rating: nil, emoji: nil, text: text)
            } else {
                metadata_inputting.story!.update(text: text)
            }
        }
        .autocapitalization(.none)
        .disableAutocorrection(false)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

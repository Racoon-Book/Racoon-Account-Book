import SwiftDate
import SwiftUI

struct StoryField: View {
    @Binding var story_inputting: ExpenseInfo.Story?

    var hint: String = ""

    @State private var text: String

    init(story: Binding<ExpenseInfo.Story?>, hint: String) {
        _story_inputting = story

        _text = State(initialValue: (story.wrappedValue == nil) ? "" : (story.wrappedValue!.text ?? ""))

        self.hint = hint
    }

    var body: some View {
        ZStack {
            TextEditor(text: $text)
                .padding(.all, 4)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(defaultColorSet.capsule.tag, lineWidth: 2)
                )
        }
        .onChange(of: text) { _ in
            UpdateStoryText()
        }
        .autocapitalization(.none)
        .disableAutocorrection(false)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }

    private func UpdateStoryText() {
        if story_inputting == nil {
            story_inputting = ExpenseInfo.Story(rating: nil, emoji: nil, text: text)
        } else {
            story_inputting!.update(text: text)
        }
    }
}

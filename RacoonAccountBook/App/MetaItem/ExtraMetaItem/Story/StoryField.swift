import SwiftDate
import SwiftUI

struct StoryField: View {
    @Binding var metadata_inputting: ExpenseInfo

    var hint: String = ""

    @State private var text: String = ""

    var body: some View {
        ZStack {
            TextEditor(text: $text)
                .padding(.all, 4)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color("Add-Tag"), lineWidth: 2)
                )
        }
        .onChange(of: text) { _ in
            printLog("[StoryField] Changed.")
            UpdateStoryText()
        }
        .autocapitalization(.none)
        .disableAutocorrection(false)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }

    private func UpdateStoryText() {
        if metadata_inputting.story == nil {
            metadata_inputting.story = ExpenseInfo.Story(rating: nil, emoji: nil, text: text)
        } else {
            metadata_inputting.story!.update(text: text)
        }
    }
}

import SwiftDate
import SwiftUI

struct StoryField: View {
    @Binding var metadata_inputting: MetaItem

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
        .frame(minHeight: 50, maxHeight: 125) // 别撑满页面
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
            metadata_inputting.story = MetaItem.Story(rating: nil, emoji: nil, text: text)
        } else {
            metadata_inputting.story!.update(text: text)
        }
    }
}

struct StoryFieldView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        OrdinaryAddSheet(
            addUIConfig: .constant(
                AddUIConfig(isShowingOrdinaryAddView: true,
                            isShowingVoiceInputView: false)),
            metadata_inputting: .constant(
                MetaItem(
                    originalText: "",
                    spentMoneyAt: DateInRegion(region: regionChina),
                    event: "买饮料",
                    amount_float: 3.5)),
            amount_string_inputting: .constant("3.5"))
    }
}

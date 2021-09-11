import SwiftUI

struct TagsSuggestionView: View {
    @Binding var expenseInfo_inputting: ExpenseInfo

    var body: some View {
        HStack {
            if expenseInfo_inputting.generatedTags != [] {
                Text("建议")
                    .font(.system(.headline))
                VStack(alignment: .leading) {
                    MultilineTagsViewForModify(
                        tags: $expenseInfo_inputting.generatedTags,
                        expenseInfo_inputting: $expenseInfo_inputting,
                        isEditMode: false,
                        isSuggestion: true,
                        color: defaultColorSet.capsule.unselectedTag
                    )
                }
            } else {
                EmptyView()
            }
        }
    }
}

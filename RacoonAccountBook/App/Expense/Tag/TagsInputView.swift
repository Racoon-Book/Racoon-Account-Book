import SwiftUI

struct TagsInputView: View {
    @Binding var expenseInfo_inputting: ExpenseInfo

    var body: some View {
        HStack {
            Text("标签")
                .font(.system(.headline))
            VStack(alignment: .leading) {
                MultilineTagsViewForModify(
                    tags: $expenseInfo_inputting.tags,
                    expenseInfo_inputting: $expenseInfo_inputting,
                    isEditMode: true,
                    color: defaultColorSet.capsule.tag
                )
                TagField(
                    hint: "添加新标签",
                    expenseInfo_inputting: $expenseInfo_inputting
                )
                .padding([.vertical], 5) // 不和下面的挨太近
            }
        }
    }
}

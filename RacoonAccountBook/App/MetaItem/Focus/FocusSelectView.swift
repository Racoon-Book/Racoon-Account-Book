import SwiftUI

struct FocusSelectView: View {
    @Binding var metadata_inputting: ExpenseInfo
    @Environment(\.managedObjectContext) private var context

    var body: some View {
        HStack {
            Text("关注")
                .font(.system(.headline))
            VStack(alignment: .leading) {
                MultilineFociView(
                    foci: .constant(["focus1","focus2"]),
                    metadata_inputting: $metadata_inputting,
                    selectedColor: Color("focus"),
                    unselectedColor: Color("focus-unselected")
                )
            }
        }
    }
}

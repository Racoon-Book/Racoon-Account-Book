import CoreData
import SwiftUI

struct FocusSelectView: View {
    @Binding var expenseInfo_inputting: ExpenseInfo
    @Environment(\.managedObjectContext) private var context

    @FetchRequest(fetchRequest: Focus.request_allFocus)
    private var focusList: FetchedResults<Focus>

    var body: some View {
        HStack {
            Text("关注")
                .font(.system(.headline))
            VStack(alignment: .leading) {
                MultilineFociView(
                    foci: .constant(focusList.map { focus in
                        focus.name
                    }),
                    expenseInfo_inputting: $expenseInfo_inputting,
                    selectedColor: defaultColorSet.capsule.focus,
                    unselectedColor: defaultColorSet.capsule.unselectedFocus
                )
            }
        }
    }
}

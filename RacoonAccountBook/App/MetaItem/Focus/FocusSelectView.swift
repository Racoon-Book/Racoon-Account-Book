import SwiftUI
import CoreData

struct FocusSelectView: View {
    @Binding var metadata_inputting: ExpenseInfo
    @Environment(\.managedObjectContext) private var context
    
    @FetchRequest(fetchRequest: Focus.request_allFocus)
    private var focusList: FetchedResults<Focus>

    var body: some View {
        HStack {
            Text("关注")
                .font(.system(.headline))
            VStack(alignment: .leading) {
                MultilineFociView(
                    foci: .constant(focusList.map({ focus in
                        focus.name
                    })),
                    metadata_inputting: $metadata_inputting,
                    selectedColor: Color("focus"),
                    unselectedColor: Color("focus-unselected")
                )
            }
        }
    }
}

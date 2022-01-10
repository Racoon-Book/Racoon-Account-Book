import SwiftUI

struct NewExtraExpenseInfoButtons: View {
    @Binding var expenseInfo_inputting: ExpenseInfo

    @Binding var showingStory: Bool
    @Binding var showingForWho: Bool

    var body: some View {
        HStack {
            Text("添加")
                .font(.system(.headline))

            SingleExtraExpenseInfoView(expenseInfo_inputting: $expenseInfo_inputting,
                                       extraExpenseInfoName: "财记",
                                       showing: $showingStory,
                                       color: Color.blue)
                .padding([.horizontal], 4)

            SingleExtraExpenseInfoView(expenseInfo_inputting: $expenseInfo_inputting,
                                       extraExpenseInfoName: "为谁",
                                       showing: $showingForWho,
                                       color: Color.blue)
                .padding([.horizontal], 4)

            Spacer()
        }
    }
}

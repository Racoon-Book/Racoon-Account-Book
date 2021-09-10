import SwiftUI

struct NewExtraExpenseInfoButtons: View {
    @Binding var metadata_inputting: ExpenseInfo

    @Binding var showingStory: Bool
    @Binding var showingForWho: Bool

    var body: some View {
        HStack {
            Text("添加")
                .font(.system(.headline))

            SingleNewItemView(metadata_inputting: $metadata_inputting,
                              metaDataName: "财记",
                              showing: $showingStory,
                              color: Color("Add-Tag"))
                .padding([.horizontal], 4)

            SingleNewItemView(metadata_inputting: $metadata_inputting,
                              metaDataName: "为谁",
                              showing: $showingForWho,
                              color: Color.orange)
                .padding([.horizontal], 4)

            Spacer()
        }
    }
}

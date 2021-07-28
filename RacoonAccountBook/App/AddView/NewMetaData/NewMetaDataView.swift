import SwiftUI

struct NewMetaDataButtons: View {
    @Binding var metadata_inputting: MetaItem

    @Binding var showingStoryInputView: Bool
    @Binding var showingForWhoInputView: Bool

    var body: some View {
        HStack {
            Text("添加")
                .font(.system(.headline))
            SingleNewItemView(metadata_inputting: $metadata_inputting,
                              metaDataName: "财记",
                              showing: $showingStoryInputView,
                              color: Color("Add-Tag"))
                .padding([.horizontal], 4)
            SingleNewItemView(metadata_inputting: $metadata_inputting,
                              metaDataName: "为谁",
                              showing: $showingForWhoInputView,
                              color: Color.orange)
                .padding([.horizontal], 4)
            Spacer()
        }
    }
}

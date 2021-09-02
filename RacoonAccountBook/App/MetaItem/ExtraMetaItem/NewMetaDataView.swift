import SwiftUI

struct NewMetaDataButtons: View {
    @Binding var metadata_inputting: MetaItem

    @Binding var extraMetaItemConfig: ExtraMetaItemConfig

    var body: some View {
        HStack {
            Text("添加")
                .font(.system(.headline))

            SingleNewItemView(metadata_inputting: $metadata_inputting,
                              metaDataName: "财记",
                              showing: $extraMetaItemConfig.showingStory,
                              color: Color("Add-Tag"))
                .padding([.horizontal], 4)

            SingleNewItemView(metadata_inputting: $metadata_inputting,
                              metaDataName: "为谁",
                              showing: $extraMetaItemConfig.showingForWho,
                              color: Color.orange)
                .padding([.horizontal], 4)

            Spacer()
        }
    }
}

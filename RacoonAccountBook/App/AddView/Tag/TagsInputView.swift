import SwiftUI

struct TagsInputView: View {
    @Binding var metadata_inputting: MetaItem

    var body: some View {
        HStack {
            Text("标签")
                .font(.system(.headline))
            VStack(alignment: .leading) {
                MultilineTagsView(
                    tags: $metadata_inputting.tags,
                    metadata_inputting: $metadata_inputting,
                    isEditMode: true,
                    color: Color("Add-Tag")
                )
                TagField(
                    hint: "添加新标签",
                    metadata_inputting: $metadata_inputting
                )
                .padding([.vertical], 5) // 不和下面的挨太近
            }
        }
    }
}

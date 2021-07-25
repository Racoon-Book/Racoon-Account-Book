import SwiftUI

struct TagsInputView: View {
    @Binding var metadata_inputting: MetaItem

    var isEditMode: Bool // true的话会显示x号
    var color: Color

    var body: some View {
        HStack {
            Text("标签")
                .font(.system(.headline))
            VStack {
                MultilineTagsView(
                    tags: $metadata_inputting.tags,
                    isEditMode: isEditMode,
                    color: color
                )
                TagField(
                    hint: "添加新标签",
                    metadata_inputting: $metadata_inputting
                )
            }
        }
    }
}

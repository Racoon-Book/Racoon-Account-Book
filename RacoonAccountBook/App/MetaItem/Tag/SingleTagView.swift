import SwiftUI

struct SingleTagView: View {
    @Binding var metadata_inputting: MetaItem // 点击x号需要在tags中删除tag

    var tag: String

    var isEditMode: Bool // 是的话会显示x号
    var isSuggestedTag: Bool = false
    var color: Color

    var body: some View {
        HStack {
            if isEditMode {
                Button(action: {
                    metadata_inputting.generatedTags.append(tag)
                    metadata_inputting.tags.remove(object: tag)
                }, label: {
                    Text(Image(systemName: "multiply.circle"))
                })
            }
            Text(tag)
                .onTapGesture {
                    if isSuggestedTag {
                        metadata_inputting.tags.append(tag)
                        metadata_inputting.generatedTags.remove(object: tag)
                    }
                }
        }
        .padding(4)
        .foregroundColor(.white) // 设置tag和图标的颜色
        .background(color)
        .cornerRadius(6) // 这个不能删 不然边框不是圆的
    }
}

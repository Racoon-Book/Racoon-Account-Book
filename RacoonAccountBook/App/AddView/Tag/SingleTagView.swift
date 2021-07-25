import SwiftUI

struct SingleTagView: View {
    @Binding var tags: [String] // 点击x号需要在tags中删除tag
    var tag: String

    var isEditMode: Bool // 是的话会显示x号
    var color: Color

    var body: some View {
        HStack {
            if isEditMode {
                Button(action: {
                    tags.remove(object: tag)
                }, label: {
                    Text(Image(systemName: "multiply.circle"))
                })
            }
            Text(tag)
        }
        .padding(4)
        .foregroundColor(.white) // 设置tag和图标的颜色
        .background(color)
        .cornerRadius(6) // 这个不能删 不然边框不是圆的
    }
}

struct SingleTagView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SingleTagView(
                tags: .constant(["牛奶", "面包"]),
                tag: "牛奶",
                isEditMode: true,
                color: .blue
            )
        }
    }
}

import SwiftUI

struct SingleNewItemView: View {
    @Binding var metadata_inputting: ExpenseInfo // 点击x号需要在tags中删除tag

    var metaDataName: String // 显示要添加的新MetaData的显示名称
    @Binding var showing: Bool

    var color: Color

    var body: some View {
        if !showing {
            Button(action: {
                showing = true
            }, label: {
                HStack {
                    Text(Image(systemName: "plus.circle"))
                    Text(metaDataName)
                }
                .padding(4)
                .foregroundColor(.white) // 设置tag和图标的颜色
                .background(color)
                .cornerRadius(6) // 这个不能删 不然边框不是圆的
            })
        } else {
            EmptyView()
        }
    }
}

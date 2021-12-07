import SwiftUI

struct SingleSomebodyView: View {
    @Binding var expenseInfo_inputting: ExpenseInfo // 点击x号需要在tags中删除tag

    var sb: String

    var isEditMode: Bool // 是的话会显示x号
    var color: Color

    var body: some View {
        HStack {
            if isEditMode {
                Button(action: {
                    expenseInfo_inputting.forWho.remove(object: sb)
                }, label: {
                    Text(Image(systemName: "multiply.circle"))
                })
            }
            Text(sb)
        }
        .padding(4)
        .foregroundColor(.white) // 设置tag和图标的颜色
        .background(color)
        .cornerRadius(6) // 这个不能删 不然边框不是圆的
    }
}

import SwiftUI

struct SingleExtraExpenseInfoView: View {
    @Binding var expenseInfo_inputting: ExpenseInfo // 点击x号需要在tags中删除tag

    var extraExpenseInfoName: String // 显示要添加的新ExpenseInfo的显示名称
    @Binding var showing: Bool

    var color: Color

    var body: some View {
        if !showing {
            Button(action: {
                showing = true
            }, label: {
                HStack {
                    Text(Image(systemName: "plus.circle"))
                    Text(extraExpenseInfoName)
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

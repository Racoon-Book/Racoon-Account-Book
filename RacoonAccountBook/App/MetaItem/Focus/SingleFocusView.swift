import SwiftUI

struct SingleFocusView: View {
    @Binding var metadata_inputting: ExpenseInfo

    var focus: String // 该`SingleFocusView`所显示的focus
    var selectedColor: Color
    var unselectedColor: Color

    var body: some View {
        HStack {
            Text(focus)
                .onTapGesture {
                    if focus == metadata_inputting.focus {
                        metadata_inputting.focus = nil // 当前的focus已经被选中了 再次点击取消选中
                    } else if focus != metadata_inputting.focus {
                        metadata_inputting.focus = focus
                    }
                }
        }
        .padding(4)
        .foregroundColor(.white) // 设置focus和图标的颜色
        .background(focus == metadata_inputting.focus ? selectedColor : unselectedColor)
        .cornerRadius(6) // 这个不能删 不然边框不是圆的
    }
}

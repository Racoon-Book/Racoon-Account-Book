import SwiftUI

struct SingleComponentView: View {
    var text: String
    var color: Color

    var body: some View {
        Text(text)
            .padding(3) // 字和边框的距离
            .foregroundColor(.white) // 设置tag和图标的颜色
            .background(color)
            .cornerRadius(6) // 这个不能删 不然边框不是圆的
    }
}

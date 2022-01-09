import SwiftUI
import XCLog

struct SingleFocusViewForModify: View {
    @Environment(\.managedObjectContext) private var context

    @FetchRequest(fetchRequest: Focus.request_allFocus)
    var focusList

    var focus: String

    var color: Color

    var body: some View {
        HStack {
            Button(action: {
                XCLog(.error, "删除了对应的focus 还没做 因为删除可能会影响用户已经输入的账目")

                let focus = Focus.focus(name: focus, context: context)
                context.delete(focus)
                try? context.save()

            }, label: {
                Text(Image(systemName: "multiply.circle"))
            })

            Text(focus)
        }
        .padding(4)
        .foregroundColor(.white) // 设置tag和图标的颜色
        .background(color)
        .cornerRadius(6) // 这个不能删 不然边框不是圆的
    }
}

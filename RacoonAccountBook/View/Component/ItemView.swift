import SwiftUI

/// 显示一个Item
struct ItemView: View {
    // 上层View需要给当层View传值的话，当前View中定义该值为`var`
    // 当层View使用的不可更改的值，定义该值为`let`

    // 会在这个View中被更改的值定义为`@State var`(因为要保存这个值，而不是每次refresh UI的时候值都回到初始值)

    // 某值只有自己和自己的subView用，加`private`
    var originalText: String = ""
    var category: String = ""
    var amount: Float = 0

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(category)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.primary)
                Text(originalText)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(String(format: "%.1f", amount)).font(.title)
        }
    }
}

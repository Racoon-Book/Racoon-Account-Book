import SwiftUI

struct ItemView: View {
    // 上层View需要给当层View传值的话，当前View中定义该值为`var`
    // 当层View使用的不可更改的值，定义该值为`let`

    // 会在这个View中被更改的值定义为`@State var`(因为要保存这个值，而不是每次refresh UI的时候值都回到初始值)

    // 某值只有自己和自己的subView用，加`private`

    var item: AccountBook.Item

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.metadata.category)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.primary)
                Text(item.metadata.originalText)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(String(format: "%.1f", item.metadata.amount_float)).font(.title)
        }
    }
}

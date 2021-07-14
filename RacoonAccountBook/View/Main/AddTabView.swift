import Combine
import SwiftUI

struct AddTabView: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel

    // 这里只是为了方便插入数据，不然要写一堆的state；id随便起的
    @State private var item_being_input = AccountBook.Item(id: 0, originalText: "", category: "", amount: 0.0) // FIXME: 测试数据

    @State private var isEditing: Bool = false

    var body: some View {
        VStack {
            VStack {
                ItemTextField(hint: "花销说明", input_text: $item_being_input.originalText, isEditing: $isEditing)
                ItemTextField(hint: "花销种类", input_text: $item_being_input.category, isEditing: $isEditing)
                ItemFloatField(hint: "花销金额(小数)", input_float: $item_being_input.amount, isEditing: $isEditing)
            }

            Button(
                action: {
                    PutKeyboardBack() // 收起键盘

                    // FIXME: 加输入判断，不能随便就把用户的输入写进数据库
                    RacoonAccountBook.createItem(originalText: item_being_input.originalText, category: item_being_input.category, amount: item_being_input.amount)
                    item_being_input = AccountBook.Item(id: 0, originalText: "", category: "", amount: 0.0) // 值归零 等待下次输入
                },
                label: {
                    Text("记账")
                        .font(.title)
                        .border(Color(UIColor.separator))
                }
            )

            Spacer()

            // FIXME: 临时预览输入的效果
            ItemView(item: item_being_input)
                .foregroundColor(isEditing ? .red : .blue) // 正在编辑设置为红色，结束编辑设置为蓝色
                .border(Color(UIColor.separator))
        }
        .padding()
    }
}

struct ItemTextField: View {
    var hint: String = ""
    @Binding var input_text: String
    @Binding var isEditing: Bool

    var body: some View {
        TextField(
            hint,
            text: $input_text
        ) { isEditing in
            self.isEditing = isEditing
        } onCommit: {}

            .border(Color(UIColor.separator))
            .autocapitalization(.none)
            .disableAutocorrection(false)
    }
}

// 传入一个 @Binding 的 float，修改这个float
// Check https://stackoverflow.com/a/61236221/14298786
struct ItemFloatField: View {
    var hint: String = ""
    @Binding var input_float: Float
    @Binding var isEditing: Bool

    @State private var input_string: String = ""

    var body: some View {
        return TextField(hint, text: $input_string) { isEditing in
            self.isEditing = isEditing
        } onCommit: {}

            .onReceive(Just(input_string)) { typedValue in
                if let newValue = Float(typedValue) {
                    self.input_float = newValue
                }
            }
            .onAppear(perform: {
                if input_float != 0.0 {
                    self.input_string = "\(self.input_float)"
                }
            }) // 把数字的值显示出来，但不能遮挡hint

            .keyboardType(.numbersAndPunctuation) // 点击输入数字的框图显示数字键盘 这里显示小数点
            // .decimalPad 这个键盘太糟糕了！出来之后收不起来

            .border(Color(UIColor.separator))
            .autocapitalization(.none)
            .disableAutocorrection(false)
    }
}

struct AddTabView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        AddTabView(RacoonAccountBook: PreviewAccountBook)
//        EmptyView()
    }
}

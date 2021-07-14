import Combine
import SwiftUI

struct AddTabView: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel

    // 这里只是为了方便插入数据，不然要写一堆的state；id随便起的
    // FIXME: 测试数据
    @State private var metadata_being_input = AccountBook.MetaItem(originalText: "", category: "", amount: 0.0)

    @State private var isEditing: Bool = false

    var body: some View {
        VStack {
            VStack {
                ItemTextField(hint: "花销说明", input_text: $metadata_being_input.originalText, isEditing: $isEditing)
                ItemTextField(hint: "花销种类", input_text: $metadata_being_input.category, isEditing: $isEditing)
                ItemFloatField(hint: "花销金额(小数)", input_float: $metadata_being_input.amount, isEditing: $isEditing)
            }

            Button(
                action: {
                    PutKeyboardBack() // 收起键盘

                    // FIXME: 加输入判断，不能随便就把用户的输入写进数据库
                    RacoonAccountBook.createItem(metadata: metadata_being_input)
                    metadata_being_input = AccountBook.MetaItem(originalText: "", category: "", amount: 0.0) // 值归零 等待下次输入
                },
                label: {
                    Text("记账")
                        .font(.title)
                        .border(Color(UIColor.separator))
                }
            )

            Spacer()

            // FIXME: 临时预览输入的效果
            MetaItemView(metadata: metadata_being_input)
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

//            .border(Color(UIColor.separator))
            .autocapitalization(.none)
            .disableAutocorrection(false)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

// 传入一个 @Binding 的 float，修改这个float
// Check https://stackoverflow.com/a/61236221/14298786
struct ItemFloatField: View {
    var hint: String = ""
    @Binding var input_float: Float
//    @Binding var input_string: String
    @Binding var isEditing: Bool

    @State private var input_string: String = ""

    var body: some View {
        return TextField(hint, text: $input_string) { isEditing in
            // 每次isEditing改变就会触发这个函数

            self.isEditing = isEditing

        } onCommit: { input_string = "" }

            .onAppear(perform: {
                // 注意只appear一次
                // 如果是0.0，说明新的一轮已经开始；我们需要更新`@State input_string`的值
                // 这里解决的是添加数据之后 原来的框没清除掉的问题
                if input_float == 0.0 {
                    self.input_string = ""
                }

                // 如果不是0.0，那需要把这个值显示出来
                if input_float != 0.0 {
                    self.input_string = "\(self.input_float)"
                }
            }) // 把数字的值显示出来，但不能遮挡hint

            .onReceive(Just(input_string)) { typedValue in
                if let newValue = Float(typedValue) {
                    self.input_float = newValue
                }
            }

            .keyboardType(.numbersAndPunctuation) // 点击输入数字的框图显示数字键盘 这里显示小数点
            // .decimalPad 这个键盘太糟糕了！出来之后收不起来

//            .border(Color(UIColor.separator))
            .autocapitalization(.none)
            .disableAutocorrection(false)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct AddTabView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        AddTabView(RacoonAccountBook: PreviewAccountBook)
//        EmptyView()
    }
}

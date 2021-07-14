import Combine
import SwiftDate
import SwiftUI

struct AddTabView: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel

    // 是否正在编辑某个文本框
    @State private var isEditing: Bool = false

    // 为了方便 直接使用结构体MetaItem；每次添加数据之后把它们归零
    @State private var metadata_inputting = AccountBook.MetaItem(
        originalText: "",
        spentMoneyAt: DateInRegion(region: regionChina),
        event: "",
        amount_float: 0.0)
    @State private var amount_string_inputting: String = "" // 用来转换输入的可能不是小数的小数

    var body: some View {
        VStack {
            VStack {
                ItemTextField(
                    hint: "用一句话写出你的花销",
                    input_text: $metadata_inputting.originalText ?? "",
                    isEditing: $isEditing)
                ItemTextField(
                    hint: "事件",
                    input_text: $metadata_inputting.event,
                    isEditing: $isEditing)
                ItemFloatField(
                    hint: "花销金额(小数)",
                    input_float: $metadata_inputting.amount_float,
                    input_string: $amount_string_inputting,
                    isEditing: $isEditing)
            }

            Button(
                action: {
                    PutKeyboardBack() // 收起键盘

                    // FIXME: 加输入判断，不能随便就把用户的输入写进数据库
                    RacoonAccountBook.createItem(metadata: metadata_inputting)

                    // 写好了之后将inputting的数据都清零
                    metadata_inputting = AccountBook.MetaItem(
                        originalText: "",
                        spentMoneyAt: DateInRegion(region: regionChina),
                        event: "",
                        amount_float: 0.0)
                    amount_string_inputting = ""
                },
                label: {
                    Text("记账")
                        .font(.title)
                        .border(Color(UIColor.separator))
                })

            Spacer()

            // FIXME: 临时预览输入的效果
            MetaItemView(
                metadata: metadata_inputting)
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
            text: $input_text) { isEditing in
            self.isEditing = isEditing
        } onCommit: {}

            .autocapitalization(.none)
            .disableAutocorrection(false)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct ItemFloatField: View {
    var hint: String = ""
    @Binding var input_float: Float
    @Binding var input_string: String
    @Binding var isEditing: Bool

    var body: some View {
        return TextField(hint, text: $input_string) { isEditing in
            // 每次isEditing改变就会触发这个函数
            self.isEditing = isEditing
        } onCommit: { input_string = "" }
            .onAppear(perform: {
                // 如果不是0.0，那需要把这个值显示出来
                // 是0.0的话，说明刚刚点击添加按钮，目前正在记录的元数据归零了。这样需要显示hint
                if input_float != 0.0 {
                    self.input_string = "\(self.input_float)"
                }
            })
            .onReceive(Just(input_string)) { typedValue in
                // 把输入的东西转为小数
                // TODO: 如果用户将中文输入在输入框中，可以在这里做转换
                if let newValue = Float(typedValue) {
                    self.input_float = newValue
                }
            }

            .keyboardType(.numbersAndPunctuation) // 点击输入数字的框图显示数字键盘 这里显示小数点
            // TODO: 可以考虑自己定制键盘（或者找一下相关的库）
            // .decimalPad 这个键盘太糟糕了！出来之后收不起来

            .autocapitalization(.none)
            .disableAutocorrection(false)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct AddTabView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
//        AddTabView(RacoonAccountBook: PreviewAccountBook)
        EmptyView()
    }
}

import SwiftUI

struct AmountField: View {
    var hint: String = ""

    @Binding var input_float: Float
    @Binding var input_string: String

    @Binding var isEditing: Bool

    var body: some View {
        TextField(hint, text: $input_string) { isEditing in
            // 每次isEditing改变就会触发这个函数
            self.isEditing = isEditing
        } onCommit: {
            // input_string = ""
            // 这个是之前写的 不对 一回车值就没了…
        }
        .onAppear(perform: {
            // 如果不是0.0，那需要把这个值显示出来
            // 是0.0的话，说明刚刚点击添加按钮，目前正在记录的元数据归零了。这样需要显示hint
            if input_float != 0.0 {
                self.input_string = "\(self.input_float)"
            }
        })
        // 别用 onReceive()
        .onChange(of: input_string) { _ in
            if let newValue = Float(input_string) {
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

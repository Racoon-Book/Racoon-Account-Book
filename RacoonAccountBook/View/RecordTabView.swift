import SwiftUI

struct RecordTabView: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel

    @State private var inputOriginalText: String = ""
    @State private var inputCategory: String = ""
    @State private var inputAmount: String = ""

    @State private var isEditing = false

    var body: some View {
        VStack {
            Text("RecordTabView")

            Spacer()
            VStack {
                TextField(
                    "花销说明",
                    text: $inputOriginalText
                ) { isEditing in
                    self.isEditing = isEditing
                } onCommit: {}
                    .border(Color(UIColor.separator))
                    .autocapitalization(.none)
                    .disableAutocorrection(false)

                TextField(
                    "花销种类",
                    text: $inputCategory
                ) { isEditing in
                    self.isEditing = isEditing
                } onCommit: {}
                    .border(Color(UIColor.separator))
                    .autocapitalization(.none)
                    .disableAutocorrection(false)

                TextField(
                    "花销金额(小数)",
                    text: $inputAmount
                ) { isEditing in
                    self.isEditing = isEditing
                } onCommit: {}
                    .border(Color(UIColor.separator))
                    .autocapitalization(.none)
                    .disableAutocorrection(false)
            }

            // FIXME: 加输入判断，不能随便就把用户的输入写进数据库

            Button(
                action: {
                    RacoonAccountBook.createItem(originalText: inputOriginalText, category: inputCategory, amount: Float(inputAmount) ?? 0)
                    inputOriginalText = ""
                    inputCategory = ""
                    inputAmount = ""
                },
                label: {
                    Text("记账")
                        .font(.title)
                        .border(Color(UIColor.separator))
                })

            Spacer()

            /// 临时预览输入的效果
            SpeedingItemView(originalText: inputOriginalText, category: inputCategory, amount: Float(inputAmount) ?? 0)
                .foregroundColor(isEditing ? .red : .blue) // 正在编辑设置为红色，结束编辑设置为蓝色
                .border(Color(UIColor.separator))

        }.padding()
    }
}

struct RecordTabView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook: AccountBookModel = AccountBookModel()

    static var previews: some View {
        RecordTabView(RacoonAccountBook: PreviewAccountBook)
    }
}

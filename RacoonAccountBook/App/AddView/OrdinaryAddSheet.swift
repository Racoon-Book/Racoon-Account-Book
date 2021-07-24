import Combine
import SwiftDate
import SwiftUI

// struct OrdinaryAddSheet: View {
//    @Binding var addUIConfig: AddUIConfig
//    @Binding var metadata_inputting: MetaItem
//
//    var body: some View {
//
//            OrdinaryAddView(addUIConfig: $addUIConfig, metadata_inputting: $metadata_inputting)
//        }
//    }
// }

struct OrdinaryAddSheet: View {
    @EnvironmentObject var RacoonAccountBook: AccountBookModel

    @Binding var addUIConfig: AddUIConfig

    // 为了方便 直接使用结构体MetaItem；每次添加数据之后把它们归零
    @Binding var metadata_inputting: MetaItem

    // 是否正在编辑某个文本框
    // TODO: 这个没啥必要感觉 先留着吧
    @State private var isEditing: Bool = false

    @State private var amount_string_inputting: String = "" // 用来转换输入的可能不是小数的小数

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                VStack {
                    // TODO: 每次打开sheet直接将光标放在这里，键盘默认弹出
                    ItemTextField(
                        hint: "用一句话写出你的花销",
                        input_text: $metadata_inputting.originalText ?? "",
                        isEditing: $isEditing)
                    HStack {
                        ItemTextField(
                            hint: "事件",
                            input_text: $metadata_inputting.event,
                            isEditing: $isEditing)
                        ItemFloatField(
                            hint: "金额",
                            input_float: $metadata_inputting.amount_float,
                            input_string: $amount_string_inputting,
                            isEditing: $isEditing)
                    }
                }
                .padding([.vertical])

                // 预览输入的效果 - 如果用户觉得没问题，那就点击添加按钮
                ItemPreviewView(metadata: metadata_inputting)

                LargeButton(title: "记账",
                            backgroundColor: Color.blue,
                            foregroundColor: Color.white) {
                    AddNewMetaItem()
                }
                .font(.system(.title)) // TODO: 字有点小
            }
            .padding()

            .navigationBarTitle(
                Text("记一笔账"),
                displayMode: .inline)
            .navigationBarItems(
                // 左边有两个按钮
                leading:
                HStack {
                    Button(action: {
                        printLog("[OrdinaryAddSheet] `Cancle` clicked.")

                        DiscardCurrentMetaItem() // 清空正在输入的 MetaItem

                        addUIConfig.isShowingOrdinaryAddView = false // 收回sheet
                    }) { Text("取消").bold() }

                    Button(action: {
                        printLog("[OrdinaryAddSheet] `Clear` clicked.")

                        DiscardCurrentMetaItem() // 清空正在输入的 MetaItem
                    }) { Text("清除").bold() }
                },
                // 右边有一个按钮
                trailing:
                Button(action: {
                    printLog("[OrdinaryAddSheet] `Done` clicked.")

                    AddNewMetaItem() // 用MetaItem添加Item

                    addUIConfig.isShowingOrdinaryAddView = false // 收回sheet
                }) { Text("添加").bold() })
        }
    }

    func AddNewMetaItem() {
        PutKeyboardBack() // 收起键盘

        // FIXME: 加输入判断，不能随便就把用户的输入写进数据库
        // 至少amount不能为0，event不能为空
        RacoonAccountBook.createItem(metadata: metadata_inputting)

        // 写好了之后将inputting的数据都清零
        DiscardCurrentMetaItem()
    }

    func DiscardCurrentMetaItem() {
        metadata_inputting.clear()
        amount_string_inputting = ""
    }
}

// 在添加界面预览条目
struct ItemPreviewView: View {
    var metadata: MetaItem

    var body: some View {
        VStack {
            HStack {
                Text("将添加的内容")
                    .padding([.horizontal])
                Spacer() // 把 Text 顶到左边去
            }

            MetaItemView(metadata: metadata)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
        }
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
//        OrdinaryAddSheet(isPresented: .constant(true))
//            .environmentObject(PreviewAccountBook)
        EmptyView()
    }
}
import Combine
import SwiftDate
import SwiftUI

struct OrdinaryAddSheet: View {
    @EnvironmentObject var RacoonAccountBook: AccountBookModel

    @Binding var addUIConfig: AddUIConfig

    // 为了方便 直接使用结构体MetaItem；每次添加数据之后把它们归零
    @Binding var metadata_inputting: MetaItem

    @Binding var amount_string_inputting: String // 用来转换输入的可能不是小数的小数

    // 是否正在编辑某个文本框
    // TODO: 这个没啥必要感觉 先留着吧
    @State private var isEditing: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                VStack {
                    // TODO: 每次打开sheet直接将光标放在这里，键盘默认弹出
                    OriginalTextField(
                        hint: "用一句话写出你的花销",
                        metadata_inputting: $metadata_inputting,
                        isEditing: $isEditing,
                        amount_string_inputting: $amount_string_inputting)
                    HStack {
                        MetaItemTextField(
                            hint: "事件",
                            input_text: $metadata_inputting.event,
                            isEditing: $isEditing)
                        MetaItemFloatField(
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

        addUIConfig.isShowingOrdinaryAddView = false // 收回sheet
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

struct OriginalTextField: View {
    var hint: String = ""
    @Binding var metadata_inputting: MetaItem

    @Binding var isEditing: Bool
    @Binding var amount_string_inputting: String

    var body: some View {
        TextField(
            hint,
            text: $metadata_inputting.originalText ?? "") { isEditing in
            self.isEditing = isEditing
        } onCommit: {
            printLog("[OriginalTextField] Commit")
            UpdateMetaItem()
        }
        .autocapitalization(.none)
        .disableAutocorrection(false)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }

    func UpdateMetaItem() {
        metadata_inputting.amount_float = OriginalText2Amount(
            from: metadata_inputting.originalText ?? "") ?? 0.0
        amount_string_inputting = String(metadata_inputting.amount_float)

        metadata_inputting.event = OriginalText2Event(
            from: metadata_inputting.originalText ?? "") ?? ""
        metadata_inputting.generatedTags = OriginalText2GeneratedTags(
            from: metadata_inputting.originalText ?? "")
    }
}

struct MetaItemTextField: View {
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

struct MetaItemFloatField: View {
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

struct OrdinaryAddSheet_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        OrdinaryAddSheet(
            addUIConfig: .constant(
                AddUIConfig(isShowingOrdinaryAddView: true,
                            isShowingVoiceInputView: false)),
            metadata_inputting: .constant(
                MetaItem(
                    originalText: "",
                    spentMoneyAt: DateInRegion(),
                    event: "买饮料",
                    amount_float: 3.5)),
            amount_string_inputting: .constant("3.5")
        )
    }
}

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
                    // [originalText输入]
                    HStack {
                        Text("输入")
                            .font(.system(.headline))
                        // TODO: 每次打开sheet直接将光标放在这里，键盘默认弹出
                        OriginalTextField(
                            hint: "用一句话写出你的花销",
                            metadata_inputting: $metadata_inputting,
                            isEditing: $isEditing,
                            amount_string_inputting: $amount_string_inputting)
                    }

                    // 三个要素 [spentMoneyAt event amount]
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color("Add-MetaItemBG"))
                            .frame(maxHeight: 100, alignment: .center)

                        VStack {
                            HStack {
                                // TODO: 这个之后要改成可以点击修改的日期选择框
                                Text(DisplayDate(metadata_inputting.spentMoneyAt))
                                    .font(.body)
                                    .padding(.top, 6.0)
                                Spacer()
                            }
                            HStack {
                                MetaItemTextField(
                                    hint: "事件",
                                    input_text: $metadata_inputting.event,
                                    isEditing: $isEditing)

                                AmountField(
                                    hint: "金额",
                                    input_float: $metadata_inputting.amount_float,
                                    input_string: $amount_string_inputting,
                                    isEditing: $isEditing)
                                    .frame(maxWidth: 70, alignment: .trailing)
                            }
                        }
                        .padding([.horizontal], 10) // 三个要素离矩形边框远一点
                    }

                    // [标签]
                    TagsInputView(metadata_inputting: $metadata_inputting)

                    // [建议]
                    TagsSuggestionView(metadata_inputting: $metadata_inputting)

                    // [关注]
                    // TODO: 添加focus

                    // [财记]
                    StoryInputView(metadata_inputting: $metadata_inputting)
                }
                .padding([.vertical]) // 所有输入框离手机边框远一点

                LargeButton(title: "记账",
                            backgroundColor: Color.blue,
                            foregroundColor: Color.white) {
                    AddNewMetaItem()
                }
                .font(.system(.title)) // TODO: 字有点小
            }
            .padding()
            // [Sheet最上方的标题]
            .navigationBarTitle(
                Text("记一笔账"),
                displayMode: .inline)
            // [Sheet左右两侧的按钮]
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

    private func AddNewMetaItem() {
        PutKeyboardBack() // 收起键盘

        // FIXME: 加输入判断，不能随便就把用户的输入写进数据库
        // 至少amount不能为0，event不能为空
        RacoonAccountBook.createItem(metadata: metadata_inputting)

        // 写好了之后将inputting的数据都清零
        DiscardCurrentMetaItem()

        addUIConfig.isShowingOrdinaryAddView = false // 收回sheet
    }

    private func DiscardCurrentMetaItem() {
        metadata_inputting.clear()
        amount_string_inputting = ""
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
                    spentMoneyAt: DateInRegion(region: regionChina),
                    event: "买饮料",
                    amount_float: 3.5)),
            amount_string_inputting: .constant("3.5"))
    }
}

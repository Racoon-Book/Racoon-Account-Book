import Combine
import SwiftDate
import SwiftUI

struct OrdinaryAddSheet: View {
    @EnvironmentObject var RacoonAccountBook: AccountBookModel

    static let coreMetaItemHeight = CGFloat(100) // 刚好呈下三个元素
    static let amountFieldHeight = CGFloat(70) // 刚好容下四位数字带一个小数点

    // MARK: - 普通输入和语音输入是否显示

    @Binding var addUIConfig: AddUIConfig

    // MARK: - 当前正在输入的值

    // 为了方便 直接使用结构体MetaItem；每次添加数据之后把它们归零
    @Binding var metadata_inputting: MetaItem
    @Binding var amount_string_inputting: String // 用来转换输入的可能不是小数的小数

    // MARK: - Alert

    @State private var showUnsuccessfullyAddAlert: Bool = false // 是否出现提示框
    @State private var unsuccessfullyAddAlertMessage: String = "" // 添加时出现错误的提示
    @Binding var showAddSuccessfullyAlert: Bool

    // MARK: - 添加界面额外的添加选项

    @State private var showingStoryInputView: Bool = false
    @State private var showingForWhoInputView: Bool = false

    // MARK: - 是否正在编辑某个文本框

    @State private var isEditing: Bool = false // TODO: 这个没啥必要感觉 先留着吧

    var body: some View {
        NavigationView {
            ScrollView {
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
                                        .frame(
                                            maxWidth: OrdinaryAddSheet.amountFieldHeight,
                                            alignment: .trailing)
                                }
                            }
                            .padding([.horizontal], 10) // 三个要素离矩形边框远一点
                        }
                        .frame(height: OrdinaryAddSheet.coreMetaItemHeight)

                        // [标签]
                        TagsInputView(metadata_inputting: $metadata_inputting)

                        // [建议]
                        TagsSuggestionView(metadata_inputting: $metadata_inputting)

                        // [关注]
                        FocusSelectView(metadata_inputting: $metadata_inputting)

                        // [财记]
                        if showingStoryInputView {
                            StoryInputView(
                                metadata_inputting: $metadata_inputting,
                                showingStoryInputView: $showingStoryInputView)
                                .onAppear {
                                    // 出现的时候置为三星
                                    metadata_inputting.story = MetaItem.Story(
                                        rating: 3,
                                        emoji: nil,
                                        text: nil)
                                }
                        } else {
                            EmptyView()
                        }

                        // [为谁]
                        if showingForWhoInputView {
                            ForWhoInputView(
                                metadata_inputting: $metadata_inputting,
                                showingForWhoInputView: $showingForWhoInputView)
                        } else {
                            EmptyView()
                        }

                        // [新添加的项]
                        // 任意一个没在呈现就要出现
                        if !showingStoryInputView || !showingForWhoInputView {
                            NewMetaDataButtons(metadata_inputting: $metadata_inputting,
                                               showingStoryInputView: $showingStoryInputView,
                                               showingForWhoInputView: $showingForWhoInputView)
                        }
                    }
                    .padding([.vertical]) // 所有输入框离手机边框远一点

                    LargeButton(title: "记账",
                                backgroundColor: Color.blue,
                                foregroundColor: Color.white) {
                            AddNewMetaItem()
                    }
                    .font(.system(.title)) // TODO: 字有点小
                }
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
        .alert(isPresented: $showUnsuccessfullyAddAlert) {
            Alert(
                title: Text("提示"),
                message: Text(unsuccessfullyAddAlertMessage),
                dismissButton: .default(Text("OK")))
        }
    }

    private func AddNewMetaItem() {
        PutKeyboardBack() // 收起键盘

        // FIXME: 加输入判断，不能随便就把用户的输入写进数据库
        // 至少amount不能为0，event不能为空
        let noEvent: Bool = metadata_inputting.event == ""
        let noAmount: Bool = metadata_inputting.amount_float == 0

        print("-" + metadata_inputting.event + "-")

        if !noEvent && !noAmount {
            // [确认添加]
            RacoonAccountBook.createItem(metadata: metadata_inputting)

            // [添加成功显示提示]
            showAddSuccessfullyAlert = true

            // [创建好数据之后将临时数据归零了]
            DiscardCurrentMetaItem()
            addUIConfig.isShowingOrdinaryAddView = false // 收回sheet
        } else {
            if noEvent, noAmount {
                unsuccessfullyAddAlertMessage = "未输入事件和金额"
            } else if noEvent {
                unsuccessfullyAddAlertMessage = "未输入事件"
            } else if noAmount {
                unsuccessfullyAddAlertMessage = "未输入金额"
            }

            showUnsuccessfullyAddAlert = true
        }
    }

    private func DiscardCurrentMetaItem() {
        metadata_inputting.clear()
        amount_string_inputting = ""
    }
}

// struct OrdinaryAddSheet_Previews: PreviewProvider {
//    @StateObject static var PreviewAccountBook = AccountBookModel()
//
//    static var previews: some View {
//        OrdinaryAddSheet(
//            addUIConfig: .constant(
//                AddUIConfig(isShowingOrdinaryAddView: true,
//                            isShowingVoiceInputView: false)),
//            metadata_inputting: .constant(
//                MetaItem(
//                    originalText: "",
//                    spentMoneyAt: DateInRegion(region: regionChina),
//                    event: "买饮料",
//                    amount_float: 3.5)),
//            amount_string_inputting: .constant("3.5"))
//    }
// }

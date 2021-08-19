import Combine
import SwiftDate
import SwiftUI

struct OrdinaryAddSheet: View {
    @EnvironmentObject var RacoonAccountBook: AccountBookModel

    /// 该界面是添加还是修改
    var isEditingMetaItem: Bool = false
    /// 需要更新的Item的id 所有的修改都通过id来进行
    var itemidToUpdate: Int = 0

    /// 呈现转换后的条目的信息的高度
    static let coreMetaItemHeight = CGFloat(100) // 刚好呈下三个元素
    /// 金额框的宽度
    static let amountFieldWidth = CGFloat(70) // 刚好容下四位数字带一个小数点

    // MARK: - 普通输入和语音输入是否显示

    @Binding var addUIConfig: AddUIConfig

    // MARK: - 当前正在输入的值

    /// 正在输入的MetaItem
    ///
    /// 添加：确定之后保存数据并清零
    ///
    /// 修改：确定之后更新数据
    @Binding var metadata_inputting: MetaItem
    /// 用来转换输入的可能不是小数的小数
    @Binding var amount_string_inputting: String

    // MARK: - Alert

    /// 输入出错时的提示框是否出现
    @State private var showUnsuccessfullyAlert: Bool = false
    /// 错误提示框的信息
    private var unsuccessfullyAlertMessage: String {
        let noEvent: Bool = metadata_inputting.event == ""
        let noAmount: Bool = metadata_inputting.amount_float == 0

        if noEvent, noAmount {
            return "未输入事件和金额"
        } else if noEvent {
            return "未输入事件"
        } else if noAmount {
            return "未输入金额"
        } else {
            // default
            return ""
        }
    }

    /// Sheet关闭后才显示的添加成功提示
    @Binding var showSuccessfullyAlert: Bool

    // MARK: - 添加界面额外的添加选项

    /// 是否给当前的MetaItem添加财记
    @State private var showingStoryInputView: Bool = false
    /// 是否给当前的MetaItem添加ForWho
    @State private var showingForWhoInputView: Bool = false

    // MARK: - 是否正在编辑某个文本框

    /// 是否正在编辑某个文本框
    @State private var isEditing: Bool = false // TODO: 这个没啥必要感觉 先留着吧

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Spacer()

                    VStack {
                        // originalText输入
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

                        // 三个要素 spentMoneyAt event amount
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
                                            maxWidth: OrdinaryAddSheet.amountFieldWidth,
                                            alignment: .trailing)
                                }
                            }
                            .padding([.horizontal], 10) // 三个要素离矩形边框远一点
                        }
                        .frame(height: OrdinaryAddSheet.coreMetaItemHeight)

                        // 标签 Tag
                        TagsInputView(metadata_inputting: $metadata_inputting)

                        // 标签添加建议 TagGenerated
                        TagsSuggestionView(metadata_inputting: $metadata_inputting)

                        // 关注 Focus
                        FocusSelectView(metadata_inputting: $metadata_inputting)

                        // MARK: - Other

                        // 财记 Story
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

                        // 为谁 ForWho
                        if showingForWhoInputView {
                            ForWhoInputView(
                                metadata_inputting: $metadata_inputting,
                                showingForWhoInputView: $showingForWhoInputView)
                        } else {
                            EmptyView()
                        }

                        // 新添加的项
                        // 任意一个没在呈现就要出现
                        if !showingStoryInputView || !showingForWhoInputView {
                            NewMetaDataButtons(metadata_inputting: $metadata_inputting,
                                               showingStoryInputView: $showingStoryInputView,
                                               showingForWhoInputView: $showingForWhoInputView)
                        }
                    }
                    .padding([.vertical]) // 所有输入框离手机边框远一点

                    LargeButton(title: isEditingMetaItem ? "修改" : "记账",
                                backgroundColor: Color.blue,
                                foregroundColor: Color.white) {
                        printLog("[OrdinaryAddSheet] LargeDoneButton clicked.")

                        if isEditingMetaItem {
                            UpdateMetaItem()
                        } else {
                            AddNewMetaItem()
                        }
                    }
                    .font(.system(.title)) // TODO: 字有点小
                }
            }
            .padding()
            // Sheet最上方的标题
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

                        if isEditingMetaItem {
                            // 修改：什么都不做
                        } else {
                            // 添加：清空所有输入框
                            DiscardCurrentMetaItem() // 清空正在输入的 MetaItem
                        }

                        addUIConfig.isShowingOrdinaryAddView = false // 收回sheet
                    }) { Text("取消").bold() }

                    Button(action: {
                        printLog("[OrdinaryAddSheet] `Clear` clicked.")

                        if isEditingMetaItem {
                            // 修改：删除该条目
                            // FIXME: x
                        } else {
                            // 添加：清空所有输入框
                            DiscardCurrentMetaItem() // 清空正在输入的 MetaItem
                        }

                    }) { Text(isEditingMetaItem ? "删除" : "清除").bold() }
                },
                // 右边有一个按钮
                trailing:
                Button(action: {
                    printLog("[OrdinaryAddSheet] `Done` clicked.")

                    if isEditingMetaItem {
                        // 修改
                        UpdateMetaItem() // 用当前正在输入的MetaItem更新id为itemidToUpdate的数据库Item
                    } else {
                        // 添加
                        AddNewMetaItem() // 将当前正在输入的MetaItem存储到数据库
                    }

                }) { Text(isEditingMetaItem ? "修改" : "记账").bold() })
        }
        // 发生错误的提示错误
        .alert(isPresented: $showUnsuccessfullyAlert) {
            Alert(
                title: Text("提示"),
                message: Text(unsuccessfullyAlertMessage),
                dismissButton: .default(Text("OK")))
        }
    }

    private func AddNewMetaItem() {
        PutKeyboardBack() // 收起键盘

        // 至少amount不能为0，event不能为空
        let noEvent: Bool = metadata_inputting.event == ""
        let noAmount: Bool = metadata_inputting.amount_float == 0

        if !noEvent && !noAmount {
            // 成功添加/修改
            RacoonAccountBook.createItem(metadata: metadata_inputting)

            // 添加成功显示提示
            showSuccessfullyAlert = true

            // 创建好数据之后将临时数据归零了
            DiscardCurrentMetaItem()
            addUIConfig.isShowingOrdinaryAddView = false // 收回sheet
        } else {
            // 有未输入的条目 显示提示信息
            showUnsuccessfullyAlert = true
        }
    }

    private func UpdateMetaItem() {
        PutKeyboardBack() // 收起键盘

        // 至少amount不能为0，event不能为空
        let noEvent: Bool = metadata_inputting.event == ""
        let noAmount: Bool = metadata_inputting.amount_float == 0

        if !noEvent, !noAmount {
            // TODO: 用id革面革心
            // 成功添加/修改
            let successfullyUpdate: Bool = RacoonAccountBook.updateItem(id: itemidToUpdate, metadata: metadata_inputting)

            if successfullyUpdate {
                // 添加成功显示提示
                showSuccessfullyAlert = true
            } else {
                // 未成功修改
                // FIXME: 添加给用户的提示
                printError("[OrdinaryAddSheet] UpdateMetaItem cannot find id")
            }
            // 将临时数据归零
//            DiscardCurrentMetaItem()
            addUIConfig.isShowingOrdinaryAddView = false // 收回sheet
        } else {
            // 有未输入的条目 显示提示信息
            showUnsuccessfullyAlert = true
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

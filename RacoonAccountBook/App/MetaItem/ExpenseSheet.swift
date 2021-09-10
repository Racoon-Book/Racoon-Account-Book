import Combine
import CoreData
import SwiftDate
import SwiftUI

/// 用来输入或修改一个Item的MetaItem
struct ExpenseSheet: View {
    @Environment(\.managedObjectContext) private var context

    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel

    // MARK: - 界面参数

    /// 呈现转换后的条目的信息的高度
    static let coreMetaItemHeight = CGFloat(100) // 刚好呈下三个元素
    /// 金额框的宽度
    static let amountFieldWidth = CGFloat(70) // 刚好容下四位数字带一个小数点

    // MARK: - Alert

    /// 输入出错时的提示框是否出现
    @State private var showUnsuccessfullyAlert: Bool = false
    /// 删除时提示框是否出现
    @State private var showDeleteAlertSheet: Bool = false
    /// 错误提示框的信息
    private var unsuccessfullyAlertMessage: String {
        let noEvent: Bool = RacoonSheetConfig.shared.expense_inputting.event == ""
        let noAmount: Bool = RacoonSheetConfig.shared.expense_inputting.amount == 0

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
                                hint: "用一句话写出你的花销", isEditing: $isEditing, metadata_inputting: $RacoonSheetConfig.shared.expense_inputting, amount_string_inputting: $RacoonSheetConfig.shared.amount_string_inputting)
                        }

                        // 三个要素 spentMoneyAt event amount
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color("Add-MetaItemBG"))

                            VStack {
                                HStack {
                                    // TODO: 这个之后要改成可以点击修改的日期选择框
                                    Text(DisplayDate(RacoonSheetConfig.shared.expense_inputting.spentAt))
                                        .font(.body)
                                        .padding(.top, 6.0)
                                    Spacer()
                                }
                                HStack {
                                    MetaItemTextField(
                                        hint: "事件",
                                        input_text: $RacoonSheetConfig.shared.expense_inputting.event,
                                        isEditing: $isEditing)

                                    AmountField(
                                        hint: "金额",
                                        input_float: $RacoonSheetConfig.shared.expense_inputting.amount,
                                        input_string: $RacoonSheetConfig.shared.amount_string_inputting,
                                        isEditing: $isEditing)
                                        .frame(
                                            maxWidth: ExpenseSheet.amountFieldWidth,
                                            alignment: .trailing)
                                }
                            }
                            .padding([.horizontal], 10) // 三个要素离矩形边框远一点
                        }
                        .frame(height: ExpenseSheet.coreMetaItemHeight)

                        // 标签 Tag
                        TagsInputView(metadata_inputting: $RacoonSheetConfig.shared.expense_inputting)

                        // 标签添加建议 TagGenerated
                        TagsSuggestionView(metadata_inputting: $RacoonSheetConfig.shared.expense_inputting)

                        // 关注 Focus
                        FocusSelectView(metadata_inputting: $RacoonSheetConfig.shared.expense_inputting)

                        // MARK: - Other

                        // 财记 Story
                        if RacoonSheetConfig.shared.showingStory {
                            StoryInputView(
                                metadata_inputting: $RacoonSheetConfig.shared.expense_inputting,
                                showingStoryInputView: $RacoonSheetConfig.shared.showingStory)
                                .onAppear {
                                    // 出现的时候置为三星
                                    RacoonSheetConfig.shared.expense_inputting.story = ExpenseInfo.Story(
                                        rating: 3,
                                        emoji: "😃", // FIXME:
                                        text: nil)
                                }
                        } else {
                            EmptyView()
                        }

                        // 为谁 ForWho
                        if RacoonSheetConfig.shared.showingForWho {
                            ForWhoInputView(
                                metadata_inputting: $RacoonSheetConfig.shared.expense_inputting,
                                showingForWhoInputView: $RacoonSheetConfig.shared.showingForWho)
                        } else {
                            EmptyView()
                        }

                        // 新添加的项
                        // 任意一个没在呈现就要出现
                        if !RacoonSheetConfig.shared.showingStory ||
                            !RacoonSheetConfig.shared.showingForWho
                        {
                            NewMetaDataButtons(metadata_inputting: $RacoonSheetConfig.shared.expense_inputting,
                                               showingStory: $RacoonSheetConfig.shared.showingStory,
                                               showingForWho: $RacoonSheetConfig.shared.showingForWho)
                        }
                    }
                    .padding([.vertical]) // 所有输入框离手机边框远一点

                    LargeButton(title: RacoonSheetConfig.shared.isEditMode ? "修改" : "记账",
                                backgroundColor: Color.blue,
                                foregroundColor: Color.white) {
                        if RacoonSheetConfig.shared.isEditMode {
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
                Text(RacoonSheetConfig.shared.isEditMode ? "修改账目" : "记一笔账"),
                displayMode: .inline)
            // [Sheet左右两侧的按钮]
            .navigationBarItems(
                // 左边有两个按钮
                leading:
                HStack {
                    Button(action: {
                        if RacoonSheetConfig.shared.isEditMode {
                            // 修改：什么都不做
                        } else {
                            // 添加：清空所有输入框
                            DiscardCurrentMetaItem() // 清空正在输入的 MetaItem
                        }

                        RacoonSheetConfig.shared.showingMetaItemSheet = false // 收回sheet
                    }) { Text("取消").bold() }

                    Button(action: {
                        if RacoonSheetConfig.shared.isEditMode {
                            // 修改：删除该条目
                            showDeleteAlertSheet = true
                        } else {
                            // 添加：清空所有输入框
                            DiscardCurrentMetaItem() // 清空正在输入的 MetaItem
                        }

                    }) { Text(RacoonSheetConfig.shared.isEditMode ? "删除" : "清除").bold() }
                },
                // 右边有一个按钮
                trailing:
                Button(action: {
                    if RacoonSheetConfig.shared.isEditMode {
                        // 修改
                        UpdateMetaItem() // 用当前正在输入的MetaItem更新id为itemidToUpdate的数据库Item
                    } else {
                        // 添加
                        AddNewMetaItem() // 将当前正在输入的MetaItem存储到数据库
                    }

                }) { Text(RacoonSheetConfig.shared.isEditMode ? "修改" : "记账").bold() })
        }
        // 发生错误的提示错误
        .alert(isPresented: $showUnsuccessfullyAlert) {
            Alert(
                title: Text("提示"),
                message: Text(unsuccessfullyAlertMessage),
                dismissButton: .default(Text("OK")))
        }
        .actionSheet(isPresented: $showDeleteAlertSheet) {
            ActionSheet(title: Text("删除此记录"),
                        message: Text("删除此记录会同时删除对应的财记，且无法找回"),
                        buttons: [.cancel(), .destructive(Text("删除"), action: DeleteMetaItem)])
        }
        .environmentObject(RacoonSheetConfig)
    }

    private func DeleteMetaItem() {
        PutKeyboardBack()

        let deleteResult: Bool = Expense.delete(uuid: RacoonSheetConfig.shared.uuidOfExpenseToEdit!, context: context)

        if !deleteResult {
            // TODO: 提示用户删除失败/成功
            print(Log().error + "删除失败")
        }

        RacoonSheetConfig.shared.showingMetaItemSheet = false // 收回sheet
    }

    private func AddNewMetaItem() {
        PutKeyboardBack() // 收起键盘

        // 至少amount不能为0，event不能为空
        let noEvent: Bool = RacoonSheetConfig.shared.expense_inputting.event == ""
        let noAmount: Bool = RacoonSheetConfig.shared.expense_inputting.amount == 0

        if !noEvent && !noAmount {
            // 进行添加
            Expense.create(expenseInfo: RacoonSheetConfig.shared.expense_inputting, context: context)

            // 添加成功显示提示
            RacoonSheetConfig.shared.showingSuccessfullyAlert = true

            RacoonSheetConfig.shared.showingMetaItemSheet = false // 收回sheet
        } else {
            // 有未输入的条目 显示提示信息
            showUnsuccessfullyAlert = true
        }
    }

    private func UpdateMetaItem() {
        PutKeyboardBack() // 收起键盘

        // 至少amount不能为0，event不能为空
        let noEvent: Bool = RacoonSheetConfig.shared.expense_inputting.event == ""
        let noAmount: Bool = RacoonSheetConfig.shared.expense_inputting.amount == 0

        if !noEvent, !noAmount {
            // TODO: 用id革面革心
            // 修改
            let successfullyUpdate: Bool = Expense.updateBy(
                uuid: RacoonSheetConfig.shared.uuidOfExpenseToEdit!,
                expenseInfo: RacoonSheetConfig.shared.expense_inputting,
                context: context)

            if successfullyUpdate {
                // 添加成功显示提示
                RacoonSheetConfig.shared.showingSuccessfullyAlert = true
            } else {
                // 未成功修改
                print(Log().fatalerror + "UpdateMetaItem cannot find id")
            }

            RacoonSheetConfig.shared.showingMetaItemSheet = false // 收回sheet
        } else {
            // 有未输入的条目 显示提示信息
            showUnsuccessfullyAlert = true
        }
    }

    private func DiscardCurrentMetaItem() {
        RacoonSheetConfig.shared.expense_inputting.clear()
        RacoonSheetConfig.shared.amount_string_inputting = ""
    }
}

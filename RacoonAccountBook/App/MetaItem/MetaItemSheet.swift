import Combine
import SwiftDate
import SwiftUI

/// 用来输入或修改一个Item的MetaItem
struct MetaItemSheet: View {
    
    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel

    // MARK: - 界面参数

    /// 呈现转换后的条目的信息的高度
    static let coreMetaItemHeight = CGFloat(100) // 刚好呈下三个元素
    /// 金额框的宽度
    static let amountFieldWidth = CGFloat(70) // 刚好容下四位数字带一个小数点

    // MARK: - Alert

    /// 输入出错时的提示框是否出现
    @State private var showUnsuccessfullyAlert: Bool = false
    /// 错误提示框的信息
    private var unsuccessfullyAlertMessage: String {
        let noEvent: Bool = RacoonSheetConfig.shared.metadata_inputting.event == ""
        let noAmount: Bool = RacoonSheetConfig.shared.metadata_inputting.amount_float == 0

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

    // MARK: - 添加界面额外的添加选项

    /// 是否显示除了基础条目以外的条目
    @State private var extraMetaItemConfig = ExtraMetaItemConfig(
        showingStory: false,
        showingForWho: false)

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
                                hint: "用一句话写出你的花销", isEditing: $isEditing, metadata_inputting: $RacoonSheetConfig.shared.metadata_inputting, amount_string_inputting: $RacoonSheetConfig.shared.amount_string_inputting
                            )
                        }

                        // 三个要素 spentMoneyAt event amount
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color("Add-MetaItemBG"))

                            VStack {
                                HStack {
                                    // TODO: 这个之后要改成可以点击修改的日期选择框
                                    Text(DisplayDate(RacoonSheetConfig.shared.metadata_inputting.spentMoneyAt))
                                        .font(.body)
                                        .padding(.top, 6.0)
                                    Spacer()
                                }
                                HStack {
                                    MetaItemTextField(
                                        hint: "事件",
                                        input_text: $RacoonSheetConfig.shared.metadata_inputting.event,
                                        isEditing: $isEditing)

                                    AmountField(
                                        hint: "金额",
                                        input_float: $RacoonSheetConfig.shared.metadata_inputting.amount_float,
                                        input_string: $RacoonSheetConfig.shared.amount_string_inputting,
                                        isEditing: $isEditing)
                                        .frame(
                                            maxWidth: MetaItemSheet.amountFieldWidth,
                                            alignment: .trailing)
                                }
                            }
                            .padding([.horizontal], 10) // 三个要素离矩形边框远一点
                        }
                        .frame(height: MetaItemSheet.coreMetaItemHeight)

                        // 标签 Tag
                        TagsInputView(metadata_inputting: $RacoonSheetConfig.shared.metadata_inputting)

                        // 标签添加建议 TagGenerated
                        TagsSuggestionView(metadata_inputting: $RacoonSheetConfig.shared.metadata_inputting)

                        // 关注 Focus
                        FocusSelectView(metadata_inputting: $RacoonSheetConfig.shared.metadata_inputting)

                        // MARK: - Other

                        // 财记 Story
                        if extraMetaItemConfig.showingStory {
                            StoryInputView(
                                metadata_inputting: $RacoonSheetConfig.shared.metadata_inputting,
                                showingStoryInputView: $extraMetaItemConfig.showingStory)
                                .onAppear {
                                    // 出现的时候置为三星
                                    RacoonSheetConfig.shared.metadata_inputting.story = ExpenseInfo.Story(
                                        rating: 3,
                                        emoji: "😃", // FIXME:
                                        text: nil)
                                }
                        } else {
                            EmptyView()
                        }

                        // 为谁 ForWho
                        if extraMetaItemConfig.showingForWho {
                            ForWhoInputView(
                                metadata_inputting: $RacoonSheetConfig.shared.metadata_inputting,
                                showingForWhoInputView: $extraMetaItemConfig.showingForWho)
                        } else {
                            EmptyView()
                        }

                        // 新添加的项
                        // 任意一个没在呈现就要出现
                        if !extraMetaItemConfig.showingStory ||
                            !extraMetaItemConfig.showingForWho
                        {
                            NewMetaDataButtons(metadata_inputting: $RacoonSheetConfig.shared.metadata_inputting,
                                               extraMetaItemConfig: $extraMetaItemConfig)
                        }
                    }
                    .padding([.vertical]) // 所有输入框离手机边框远一点

                    LargeButton(title: RacoonSheetConfig.shared.isEditMode ? "修改" : "记账",
                                backgroundColor: Color.blue,
                                foregroundColor: Color.white) {
                        printLog("[OrdinaryAddSheet] LargeDoneButton clicked.")

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
                Text("记一笔账"),
                displayMode: .inline)
            // [Sheet左右两侧的按钮]
            .navigationBarItems(
                // 左边有两个按钮
                leading:
                HStack {
                    Button(action: {
                        printLog("[OrdinaryAddSheet] `Cancle` clicked.")

                        if RacoonSheetConfig.shared.isEditMode {
                            // 修改：什么都不做
                        } else {
                            // 添加：清空所有输入框
                            DiscardCurrentMetaItem() // 清空正在输入的 MetaItem
                        }

                        RacoonSheetConfig.shared.showingMetaItemSheet = false // 收回sheet
                    }) { Text("取消").bold() }

                    Button(action: {
                        printLog("[OrdinaryAddSheet] `Clear` clicked.")

                        if RacoonSheetConfig.shared.isEditMode {
                            // 修改：删除该条目
                            // FIXME: x
                        } else {
                            // 添加：清空所有输入框
                            DiscardCurrentMetaItem() // 清空正在输入的 MetaItem
                        }

                    }) { Text(RacoonSheetConfig.shared.isEditMode ? "删除" : "清除").bold() }
                },
                // 右边有一个按钮
                trailing:
                Button(action: {
                    printLog("[OrdinaryAddSheet] `Done` clicked.")

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
        .environmentObject(RacoonSheetConfig)
    }

    private func AddNewMetaItem() {
        PutKeyboardBack() // 收起键盘

        // 至少amount不能为0，event不能为空
        let noEvent: Bool = RacoonSheetConfig.shared.metadata_inputting.event == ""
        let noAmount: Bool = RacoonSheetConfig.shared.metadata_inputting.amount_float == 0

        if !noEvent && !noAmount {
            // 成功添加/修改
            // TODO: add Core Data
//            RacoonAccountBook.createItem(metadata: RacoonSheetConfig.shared.metadata_inputting)

            // 添加成功显示提示
            RacoonSheetConfig.shared.showingSuccessfullyAlert = true

            // 没必要，因为每次打开sheet的时候进行更新，而且SuccessfullyAlert那边还要用呢！
//            // 创建好数据之后将临时数据归零了
//            DiscardCurrentMetaItem()

            RacoonSheetConfig.shared.showingMetaItemSheet = false // 收回sheet
        } else {
            // 有未输入的条目 显示提示信息
            showUnsuccessfullyAlert = true
        }
    }

    private func UpdateMetaItem() {
        PutKeyboardBack() // 收起键盘

        // 至少amount不能为0，event不能为空
        let noEvent: Bool = RacoonSheetConfig.shared.metadata_inputting.event == ""
        let noAmount: Bool = RacoonSheetConfig.shared.metadata_inputting.amount_float == 0

        if !noEvent, !noAmount {
            // TODO: 用id革面革心
            // 成功添加/修改
            // TODO: add Core Data
//            let successfullyUpdate: Bool = RacoonAccountBook.updateItem(
//                id: RacoonSheetConfig.shared.itemIdToEdit,
//                metadata: RacoonSheetConfig.shared.metadata_inputting)
//
//            if successfullyUpdate {
//                // 添加成功显示提示
//                RacoonSheetConfig.shared.showingSuccessfullyAlert = true
//            } else {
//                // 未成功修改
//                // FIXME: 添加给用户的提示
//                printError("[OrdinaryAddSheet] UpdateMetaItem cannot find id")
//            }

            RacoonSheetConfig.shared.showingMetaItemSheet = false // 收回sheet
        } else {
            // 有未输入的条目 显示提示信息
            showUnsuccessfullyAlert = true
        }
    }

    private func DiscardCurrentMetaItem() {
        RacoonSheetConfig.shared.metadata_inputting.clear()
        RacoonSheetConfig.shared.amount_string_inputting = ""
    }
}

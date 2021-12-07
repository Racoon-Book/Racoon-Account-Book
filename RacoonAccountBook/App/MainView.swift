import SwiftDate
import SwiftUI
import UIKit

struct MainView: View {
    @Environment(\.managedObjectContext) private var context

    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel

    // TabView需要用到的东西
    private static let Tab1: String = "账本"
    private static let Tab2: String = "财记"
    private static let Tab3: String = "统计"
    private static let Tab4: String = "我的"

    /// 当前选中的Tab
    ///
    /// 默认值为打开之后呈现的Tab (默认为账本界面)
    @State private var selectedTab = MainView.Tab1

    /// 添加时临时记录使用的expenseInfo
    @State private var expenseInfo_inputting = ExpenseInfo(
        originalText: "",
        spentAt: DateInRegion(region: regionChina),
        event: "",
        amount: 0.0
    )

    /// 临时记录输入的金额字符串（因为可能用户并没有输入小数）
    @State private var amount_string_inputting: String = ""

    /// 菜单向左平移量与宽度的比值
    @State private var sideMenuOffsetX: Float = 1

    var isSideMenuOpen: Bool {
        return sideMenuOffsetX == 0
    }

    func onSideMenuClose() {
        sideMenuOffsetX = 1
        RacoonSheetConfig.shared.blurRadius = 0
    }

    func onSideMenuOpen() {
        sideMenuOffsetX = 0
        RacoonSheetConfig.shared.blurRadius = 4.0
    }

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                BookTab(onSideMenuOpen: onSideMenuOpen, onSideMenuClose: onSideMenuClose, isSideMenuOpen: isSideMenuOpen)

                    .tabItem {
                        Image(systemName: "text.book.closed.fill")
                        Text(MainView.Tab1)
                    }
                    .tag(MainView.Tab1)

                StoryTab()
                    .tabItem {
                        Image(systemName: "books.vertical.fill")
                        Text(MainView.Tab2)
                    }
                    .tag(MainView.Tab2)

                ReportTab()
                    .tabItem {
                        Image(systemName: "chart.pie.fill")
                        Text(MainView.Tab3)
                    }
                    .tag(MainView.Tab3)
            }

            // 成功记账提示
            if RacoonSheetConfig.shared.showingSuccessfullyAlert {
                SuccessfullyAlert(
                    showAddSuccessfullyAlert: $RacoonSheetConfig.shared.showingSuccessfullyAlert
                )
                .environmentObject(RacoonSheetConfig)
            }

            // VoiceInputView 在 FloatingAddButton 中显示
            if selectedTab == MainView.Tab1 {
                FloatingAddButton(expenseInfo_inputting: $expenseInfo_inputting)
            }
        }
        .sheet(
            // 点击FloatingAddButton会弹出sheet让用户添加；语音输入结束该页面也会弹出
            isPresented: $RacoonSheetConfig.shared.showingExpenseSheet,
            onDismiss: didDismissExpenseSheet
        ) {
            ExpenseSheet()
                .environmentObject(RacoonSheetConfig)
                .environment(\.managedObjectContext, context) // 注意Sheet和使用它的View并不是view hierarchy的关系，所以要手动传入EnvironmentObject
        }
        // .edgesIgnoringSafeArea(.top)
    }

    private func didDismissExpenseSheet() {
        func DiscardCurrentExpense() {
            expenseInfo_inputting.clear()
            amount_string_inputting = ""
        }
        DiscardCurrentExpense()

        print(Log().string + "Dismissed")
    }
}

// struct MainView_Previews: PreviewProvider {
//    @StateObject static var PreviewAccountBook = AccountBookModel()
//
//    static var previews: some View {
//        MainView()
//            .environmentObject(PreviewAccountBook)
//    }
// }

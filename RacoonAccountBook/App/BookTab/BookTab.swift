import CoreData
import SwiftDate
import SwiftUI

struct BookTab: View {
    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel

    @Environment(\.managedObjectContext) private var context

    @State private var selectedDate = Date()

    private let onSideMenuOpen: () -> Void
    private let onSideMenuClose: () -> Void
    private let isSideMenuOpen: Bool

    // --- 31 ---

    init(thisYear _: Int = DateInRegion(region: regionChina).year,
         thisMonth _: Int = DateInRegion(region: regionChina).month,
         onSideMenuOpen: @escaping () -> Void,
         onSideMenuClose: @escaping () -> Void,
         isSideMenuOpen: Bool)
    {
        print(Log().string + "BookTab View init")
        // 打开app默认展示的月份为当月

        self.onSideMenuOpen = onSideMenuOpen
        self.onSideMenuClose = onSideMenuClose
        self.isSideMenuOpen = isSideMenuOpen
    }

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ZStack {
                    defaultColorSet.tabBackground.ignoresSafeArea() // 把背景撑开 没有账单的时候显示会只有一个条块

                    MonthExpensesView(selectedDate: selectedDate)
                        .blur(radius: RacoonSheetConfig.shared.blurRadius)
                }
                .padding([.top, .bottom], 10) // 最下方别贴着屏幕底端
            }
            .background(defaultColorSet.tabBackground.ignoresSafeArea())

            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("支出")

            .navigationBarItems(
                leading:
                // ...Date() - 不能选之后的时间
                DatePicker("", selection: $selectedDate, in: ...Date(), displayedComponents: .date),

                trailing:
                // 截图导入
                Button(action: {
                    RacoonSheetConfig.shared.showingScreenshotImportSheet.toggle()
                }) { Text("截图导入") }
            )
            .sheet(
                // 点击FloatingAddButton会弹出sheet让用户添加；语音输入结束该页面也会弹出
                isPresented: $RacoonSheetConfig.shared.showingScreenshotImportSheet,
                onDismiss: didDismissScreenshotImportSheet
            ) {
                ScreenshotImportSheet()
                    .environmentObject(RacoonSheetConfig)
                    .environment(\.managedObjectContext, context)
            }
        }
    }

    private func didDismissScreenshotImportSheet() {
        print(Log().string + "Dismissed")
    }
}

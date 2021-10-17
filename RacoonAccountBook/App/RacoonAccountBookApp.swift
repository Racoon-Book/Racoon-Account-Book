// App Entrance

import CoreData
import SwiftUI

@main
struct RacoonAccountBookApp: App {
    @StateObject var RacoonSheetConfig = SheetConfigModel()

    let persistenceController = PersistenceController.shared

    init() {
        #if DEV

            // 每次重新运行App的时候，用TestData对数据库进行刷新；确保每次打开数据与TestData中的一致
            if let allExpenses = try? persistenceController.container.viewContext.fetch(Expense.request_allExpenses) {
                for expense in allExpenses {
                    persistenceController.container.viewContext.delete(expense)
                }
                for expenseInfo in testExpenseInfos {
                    Expense.create(expenseInfo: expenseInfo, context: persistenceController.container.viewContext)
                }

                let nowAllExpenses = try? persistenceController.container.viewContext.fetch(Expense.request_allExpenses)

                print(Log().string + "删除并重新插入了测试数据共\(testExpenseInfos.count)条, 现在数据库中有\(nowAllExpenses?.count ?? -1)条Expense")
            } else {
                print(Log().string + "no data in Core Data")
            }

            // 每次重新测试app 删除所有的Focus
            Focus.deleteAll(context: persistenceController.container.viewContext)

        #endif

        // 如果focusList为空 为用户添加一组默认的focus
        if Focus.focusAmount(context: persistenceController.container.viewContext) == 0 {
            let focusList: [String] = ["电子设备", "软件服务", "聚餐", "游戏", "宿舍", "支持", "旅游"] // 初始化的focusList 只在用户第一次打开才会是这样
            for focus in focusList {
                Focus.focus(name: focus, context: persistenceController.container.viewContext)
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(RacoonSheetConfig)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

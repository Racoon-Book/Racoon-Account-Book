// App Entrance

import CoreData
import SwiftUI

@main
struct RacoonAccountBookApp: App {
    @StateObject var RacoonSheetConfig = SheetConfigModel()

    let persistenceController = PersistenceController.shared

    init() {
        #if DEV
            // 测试的时候 删除所有的Focus 再进行添加
            Focus.deleteAll(context: persistenceController.container.viewContext)
            let focusList: [String] = ["电子设备", "软件服务", "聚餐", "游戏", "宿舍", "支持", "旅游"] // 初始化的focusList 只在用户第一次打开才会是这样
            for focus in focusList {
                Focus.focus(name: focus, context: persistenceController.container.viewContext)
            }
        #else
            // 实际使用：如果是第一次打开app 为用户添加一组默认的focus
            // QUESTION: 会不会出现有人卸载之后重新安装的情况啊 UserDefaults应该不是默认删除的
            if UserDefaults.isFirstLaunch() {
                // 如果focusList为空 为用户添加一组默认的focus
                if Focus.focusAmount(context: persistenceController.container.viewContext) == 0 {
                    let focusList: [String] = ["电子设备", "软件服务", "聚餐", "游戏", "宿舍", "支持", "旅游"] // 初始化的focusList 只在用户第一次打开才会是这样
                    for focus in focusList {
                        Focus.focus(name: focus, context: persistenceController.container.viewContext)
                    }
                }
            }
        #endif

        #if DEV
            // 每次重新运行App的时候，用TestData对数据库进行刷新；确保每次打开数据与TestData中的一致
            if let allExpenses = try? persistenceController.container.viewContext.fetch(Expense.request_allExpenses) {
                for expense in allExpenses {
                    persistenceController.container.viewContext.delete(expense)
                }
                for expenseInfo in GetTestExpenseInfos() {
                    Expense.create(expenseInfo: expenseInfo, context: persistenceController.container.viewContext)
                }

                let nowAllExpenses = try? persistenceController.container.viewContext.fetch(Expense.request_allExpenses)

                print(Log().string + "删除并重新插入了测试数据共\(GetTestExpenseInfos().count)条, 现在数据库中有\(nowAllExpenses?.count ?? -1)条Expense")
            } else {
                print(Log().string + "no data in Core Data")
            }

        #endif
    }

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(RacoonSheetConfig)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

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
                for metadata in testMetaItems {
                    Expense.create(expenseInfo: metadata, context: persistenceController.container.viewContext)
                }

                let nowAllExpenses = try? persistenceController.container.viewContext.fetch(Expense.request_allExpenses)

                printLog("[\((#filePath as NSString).lastPathComponent) \(#function) line\(#line)] 删除并重新插入了测试数据共\(testMetaItems.count)条, 现在数据库中有\(nowAllExpenses?.count ?? -1)条Expense")

            } else {
                printError("no data in Core Data")
            }

            if Focus.focusAmount(context: persistenceController.container.viewContext) == 0 {
                let focusList: [String] = ["电子设备", "软件服务", "聚餐", "游戏", "宿舍"]
                for focus in focusList {
                    Focus.create(name: focus, context: persistenceController.container.viewContext)
                }
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

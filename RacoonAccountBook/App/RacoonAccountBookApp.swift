// App Entrance

import SwiftUI

@main
struct RacoonAccountBookApp: App {
    @StateObject var RacoonSheetConfig = SheetConfigModel()

    let persistenceController = PersistenceController.shared

    init() {
        #if DEV

        // 在 DEV 下，当数据库为空时，插入 Testdata
        if Expense.getAddExpenses(context: persistenceController.container.viewContext).count == 0 {
            for metadata in testMetaItems {
                Expense.create(context: persistenceController.container.viewContext, metadata: metadata)
            }
        }
        print("[RacoonAccountBookApp] 插入了测试数据")

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

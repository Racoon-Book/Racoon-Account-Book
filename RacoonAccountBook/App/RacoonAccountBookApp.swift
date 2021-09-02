// App Entrance

import SwiftUI

@main
struct RacoonAccountBookApp: App {
    @StateObject var RacoonAccountBook = AccountBookModel()
    @StateObject var RacoonSheetConfig = SheetConfigModel()

    let persistenceController = PersistenceController.shared
    
    init() {
        #if DEV
        // 在 DEV 下，当数据库为空时，插入 Testdata
        if (Expense.all(context: persistenceController.container.viewContext).count == 0) {
            for metadata in testMetaItems {
                Expense.create(context: persistenceController.container.viewContext, metadata: metadata)
            }
        }
        #endif
    }

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(RacoonAccountBook)
                .environmentObject(RacoonSheetConfig)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

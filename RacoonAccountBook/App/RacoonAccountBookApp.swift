// App Entrance

import SwiftUI

@main
struct RacoonAccountBookApp: App {
    @StateObject var RacoonAccountBook = AccountBookModel()
    @StateObject var RacoonSheetConfig = SheetConfigModel()

    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(RacoonAccountBook)
                .environmentObject(RacoonSheetConfig)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

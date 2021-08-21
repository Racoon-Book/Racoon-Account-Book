// App Entrance

import SwiftUI

@main
struct RacoonAccountBookApp: App {
    @StateObject var RacoonAccountBook = AccountBookModel()
    @StateObject var RacoonSheetConfig = SheetConfigModel()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(RacoonAccountBook)
                .environmentObject(RacoonSheetConfig)
        }
    }
}

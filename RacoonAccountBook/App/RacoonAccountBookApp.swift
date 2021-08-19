// App Entrance

import SwiftUI

@main
struct RacoonAccountBookApp: App {
    @StateObject var RacoonAccountBook = AccountBookModel()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(RacoonAccountBook)
        }
    }
}

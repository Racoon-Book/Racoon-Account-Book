// App Entrance

import SwiftUI

@main
struct RacoonAccountBookApp: App {
    @StateObject var RacoonAccountBook = AccountBookModel() // 实例化Model，用`@StateObject`

    var body: some Scene {
        WindowGroup {
            MainView(RacoonAccountBook: RacoonAccountBook)
        }
    }
}

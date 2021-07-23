// App Entrance

import SwiftUI

@main
struct RacoonAccountBookApp: App {
    @StateObject var RacoonAccountBook = AccountBookModel() // global source of truth

    var body: some Scene {
        WindowGroup {
            MainView()
                // 将 App级别的Data - `RacoonAccountBook` 传到每一个子View。
                // 子View用`@EnvironmentObject`就可以获取
                .environmentObject(RacoonAccountBook)
        }
    }
}

// App Entrance

import SwiftUI

@main
struct RacoonAccountBookApp: App {
    @StateObject var RacoonAccountBook = AccountBookModel() // global source of truth

    var body: some Scene {
        WindowGroup {
            MainView()
                // 将`RacoonAccountBook`传到每一个subView
                // subView用`@EnvironmentObject var RacoonAccountBook: AccountBookModel`就可以获取
                .environmentObject(RacoonAccountBook)
        }
    }
}

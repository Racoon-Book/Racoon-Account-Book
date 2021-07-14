// App Entrance

import SwiftUI

@main
struct RacoonAccountBookApp: App {
    @StateObject var MyBook = MySpendingBook() // 实例化Model，用`@StateObject`

    var body: some Scene {
        WindowGroup {
            MainView(MyBook: MyBook)
        }
    }
}

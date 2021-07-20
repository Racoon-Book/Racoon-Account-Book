import SwiftUI

struct MainView: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel

    @State private var selectedTab = "账本" // 打开之后呈现的Tab (默认为添加界面) // TODO: 改回去

    var body: some View {
        TabView(selection: $selectedTab) {
            BookTab(RacoonAccountBook: RacoonAccountBook)
                .tabItem {
                    Image(systemName: "text.book.closed.fill")
                    Text("账本")
                }
                .tag("账本")

            StoryTab(RacoonAccountBook: RacoonAccountBook)
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("财记")
                }
                .tag("财记")

            AddTab(RacoonAccountBook: RacoonAccountBook)
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("添加")
                }
                .tag("添加")

            ReportTab(RacoonAccountBook: RacoonAccountBook)
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("报告")
                }
                .tag("统计")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        MainView(RacoonAccountBook: PreviewAccountBook)
    }
}

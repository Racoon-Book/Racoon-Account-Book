import SwiftUI

struct MainView: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel

    @State private var selectedTab = "添加" // 当前的Tab，默认为添加界面

    var body: some View {
        TabView(selection: $selectedTab) {
            BookTabView(RacoonAccountBook: RacoonAccountBook)
                .tabItem {
                    Image(systemName: "text.book.closed.fill")
                    Text("财记")
                }
                .tag("财记")

            AddTabView(RacoonAccountBook: RacoonAccountBook)
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("添加")
                }
                .tag("添加")

            ReportTabView(RacoonAccountBook: RacoonAccountBook)
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("报告")
                }
                .tag("报告")
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    @StateObject static var PreviewAccountBook = AccountBookModel()
//
//    static var previews: some View {
//        MainView(RacoonAccountBook: PreviewAccountBook)
//    }
//}

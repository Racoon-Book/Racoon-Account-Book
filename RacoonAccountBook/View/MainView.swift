import SwiftUI

struct MainView: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel

    var body: some View {
        TabView {
            BookTabView(RacoonAccountBook: RacoonAccountBook)
                .tabItem {
                    Image(systemName: "text.book.closed.fill")
                    Text("财记")
                }

            RecordTabView(RacoonAccountBook: RacoonAccountBook)
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("添加")
                }

            ReportTabView(RacoonAccountBook: RacoonAccountBook)
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("报告")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook: AccountBookModel = AccountBookModel()

    static var previews: some View {
        MainView(RacoonAccountBook: PreviewAccountBook)
    }
}

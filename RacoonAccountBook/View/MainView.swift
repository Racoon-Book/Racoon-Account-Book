import SwiftUI

struct MainView: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel

    var body: some View {
        TabView {
            RecordTabView(RacoonAccountBook: RacoonAccountBook)
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Record")
                }
            BookTabView(RacoonAccountBook: RacoonAccountBook)
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("List")
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

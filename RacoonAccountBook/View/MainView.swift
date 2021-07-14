import SwiftUI

struct MainView: View {
    @ObservedObject var MyBook: MySpendingBook

    var body: some View {
        TabView {
            RecordTabView(MyBook: MyBook)
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Record")
                }
            BookTabView(MyBook: MyBook)
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("List")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var MyBook: MySpendingBook = MySpendingBook()

    static var previews: some View {
        MainView(MyBook: MyBook)
    }
}

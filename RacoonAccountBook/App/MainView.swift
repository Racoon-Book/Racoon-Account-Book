import SwiftUI

struct MainView: View {
    @State private var selectedTab = "账本" // 打开之后呈现的Tab (默认为账本界面)
    @State var displayingOrdinaryAddView: Bool = false // TODO: 名字改成showing吧
    @State var displayingVoiceInputView: Bool = false // TODO: 名字改成showing吧

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                BookTab()
                    .tabItem {
                        Image(systemName: "text.book.closed.fill")
                        Text("账本")
                    }
                    .tag("账本")

                StoryTab()
                    .tabItem {
                        Image(systemName: "books.vertical.fill")
                        Text("财记")
                    }
                    .tag("财记")

                OrdinaryAddView()
                    .tabItem {
                        Image(systemName: "plus.circle.fill")
                        Text("添加")
                    }
                    .tag("添加")

                ReportTab()
                    .tabItem {
                        Image(systemName: "chart.pie.fill")
                        Text("报告")
                    }
                    .tag("统计")
            }

            FloatingAddButton(
                showingOrdinaryAddView: $displayingOrdinaryAddView,
                showingVoiceInputView: $displayingVoiceInputView)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        MainView()
            .environmentObject(PreviewAccountBook)
    }
}

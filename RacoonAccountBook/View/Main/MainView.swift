import SwiftUI

struct MainView: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel

    @State private var selectedTab = "账本" // 打开之后呈现的Tab (默认为添加界面) // TODO: 改回去
    @State var displayingOrdinaryAddView: Bool = false
    @State var displayingVoiceInputView: Bool = false

    var body: some View {
        ZStack {
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

            FloatingAddButton(
                displayingOrdinaryAddView: $displayingOrdinaryAddView,
                displayingVoiceInputView: $displayingVoiceInputView
            )
        }
    }
}

struct FloatingAddButton: View {
    let addButtonSize = CGFloat(50)

    @Binding var displayingOrdinaryAddView: Bool
    @Binding var displayingVoiceInputView: Bool

    var body: some View {
        HStack {
            // 用Spacer()将加好怼到最右边
            Spacer()
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: addButtonSize, height: addButtonSize)
                    Button(action: {}, label: {
                        Text(Image(systemName: "plus"))
                            .foregroundColor(.black)
                            .bold()
                            .font(.system(size: addButtonSize * 0.75))

                            .onTapGesture {
                                // 点击弹出一般添加界面
                                print("[FloatingAddButton] Tapped")
                                displayingOrdinaryAddView.toggle()
                            }

                            .onLongPressGesture {
                                // 长按弹出语音界面
                                print("[FloatingAddButton] LongPressed")
                                displayingVoiceInputView.toggle()
                            }

                    })
                }
                .padding([.horizontal], 25)
                .padding([.vertical], 80)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        MainView(RacoonAccountBook: PreviewAccountBook)
    }
}

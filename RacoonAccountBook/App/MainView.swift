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

                AddTab()
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
                displayingOrdinaryAddView: $displayingOrdinaryAddView,
                displayingVoiceInputView: $displayingVoiceInputView)
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
                            } // 注意onTapGesture在前onLongPressGesture在后

                    })
                }
                .padding([.horizontal], 25)
                .padding([.vertical], 80)
            }
        }
        .sheet(
            isPresented: $displayingOrdinaryAddView,
            onDismiss: didDismiss) {
            OrdinaryAddSheet(isPresented: $displayingOrdinaryAddView)
        }
    }

    func didDismiss() {
        printLog("[FloatingAddButton] Dismissed.")
    }
}

struct OrdinaryAddSheet: View {
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView {
            Text("Sheet View content") // TODO: 修改为添加界面
                .navigationBarTitle(
                    Text("记一笔账"),
                    displayMode: .inline)
                .navigationBarItems(
                    leading: Button(action: {
                        printLog("[OrdinaryAddSheet] `Cancle` clicked.")
                        isPresented = false // 收回sheet
                    }) { Text("取消").bold() },
                    trailing: Button(action: {
                        printLog("[OrdinaryAddSheet] `Done` clicked.")
                        isPresented = false // 收回sheet
                    }) { Text("添加").bold() })
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

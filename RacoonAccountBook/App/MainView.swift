import SwiftDate
import SwiftUI
import UIKit

struct MainView: View {
    @EnvironmentObject var RacoonAccountBook: AccountBookModel

    // [TabView需要用到的东西]
    private static let Tab1: String = "账本"
    private static let Tab2: String = "财记"
    private static let Tab3: String = "统计"
    @State private var selectedTab = MainView.Tab1 // 打开之后呈现的Tab (默认为账本界面)

    // [Add需要用到的东西]
    @State private var addUIConfig = AddUIConfig(
        isShowingOrdinaryAddView: false,
        isShowingVoiceInputView: false, // 最开始都不显示
        blurRadius: 0 // 控制TabView模糊的程度，语音输入时模糊画面
    )

    @State private var metadata_inputting = MetaItem(
        originalText: "",
        spentMoneyAt: DateInRegion(region: regionChina),
        event: "",
        amount_float: 0.0
    )

    @State private var amount_string_inputting: String = "" // 用来转换输入的可能不是小数的小数

    @State private var showAddSuccessfullyAlert: Bool = false // 添加之后显示成功添加的提示

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                BookTab()
                    .tabItem {
                        Image(systemName: "text.book.closed.fill")
                        Text(MainView.Tab1)
                    }
                    .tag(MainView.Tab1)

                StoryTab()
                    .tabItem {
                        Image(systemName: "books.vertical.fill")
                        Text(MainView.Tab2)
                    }
                    .tag(MainView.Tab2)

                ReportTab()
                    .tabItem {
                        Image(systemName: "chart.pie.fill")
                        Text(MainView.Tab3)
                    }
                    .tag(MainView.Tab3)
            }
            .blur(radius: addUIConfig.blurRadius)

            // 成功记账提示
            if showAddSuccessfullyAlert {
                SuccessfullyAddAlert(showAddSuccessfullyAlert: $showAddSuccessfullyAlert, metadata: RacoonAccountBook.wholeBook.items.last!.metadata)
            }

            // VoiceInputView 在 FloatingAddButton 中显示
            if selectedTab != MainView.Tab3 {
                FloatingAddButton(addUIConfig: $addUIConfig,
                                  metadata_inputting: $metadata_inputting)
            }
        }
        .sheet(
            // 点击FloatingAddButton会弹出sheet让用户添加；语音输入结束该页面也会弹出
            isPresented: $addUIConfig.isShowingOrdinaryAddView,
            onDismiss: didDismissOrdinaryAddSheet
        ) {
            OrdinaryAddSheet(
                addUIConfig: $addUIConfig,
                metadata_inputting: $metadata_inputting,
                amount_string_inputting: $amount_string_inputting,
                showAddSuccessfullyAlert: $showAddSuccessfullyAlert
            )
        }
    }

    private func didDismissOrdinaryAddSheet() {
        DiscardCurrentMetaItem()

        printLog("[FloatingAddButton] Dismissed.")

        func DiscardCurrentMetaItem() {
            metadata_inputting.clear()
            amount_string_inputting = ""
        }
    }
}

struct AddUIConfig {
    var isShowingOrdinaryAddView: Bool = false
    var isShowingVoiceInputView: Bool = false
    var blurRadius: CGFloat = 0
}

struct SuccessfullyAddAlert: View {
    @Binding var showAddSuccessfullyAlert: Bool
    var metadata: MetaItem
    var body: some View {
        VStack {
            Text("记了一笔账")
                .foregroundColor(.black)
                .font(.system(.title))
                .padding([.horizontal, .top])

            MetaItemView(metadata: metadata)
                .padding()
        }
        .frame(width: UIScreen.main.bounds.width - 100)
        .background(Color("alert.background").opacity(0.95))
        .cornerRadius(12)
        .clipped()
        .padding() // 和右边离远一点
        .onAppear {
            // 过一段时间自行消失
            let appearingTimeInterval: TimeInterval = 3 // seconds
            Timer.scheduledTimer(withTimeInterval: appearingTimeInterval, repeats: false) { _ in
                withAnimation(.easeInOut) {
                    showAddSuccessfullyAlert = false
                }
            }
        }
    }
}

// struct MainView_Previews: PreviewProvider {
//    @StateObject static var PreviewAccountBook = AccountBookModel()
//
//    static var previews: some View {
//        MainView()
//            .environmentObject(PreviewAccountBook)
//    }
// }

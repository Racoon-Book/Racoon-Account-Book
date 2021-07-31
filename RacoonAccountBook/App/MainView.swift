import SwiftDate
import SwiftUI

struct MainView: View {
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

            // VoiceInputView 在 FloatingAddButton 中显示
            if selectedTab != MainView.Tab3 {
                FloatingAddButton(addUIConfig: $addUIConfig,
                                  metadata_inputting: $metadata_inputting
                )
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
                amount_string_inputting: $amount_string_inputting
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

struct MainView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        MainView()
            .environmentObject(PreviewAccountBook)
    }
}

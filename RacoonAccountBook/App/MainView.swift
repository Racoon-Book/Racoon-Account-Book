import SwiftDate
import SwiftUI
import UIKit

struct MainView: View {
    @EnvironmentObject var RacoonAccountBook: AccountBookModel
    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel

    // TabView需要用到的东西
    private static let Tab1: String = "账本"
    private static let Tab2: String = "财记"
    private static let Tab3: String = "统计"

    /// 当前选中的Tab
    ///
    /// 默认值为打开之后呈现的Tab (默认为账本界面)
    @State private var selectedTab = MainView.Tab1

    /// 添加时临时记录使用的metadata
    @State private var metadata_inputting = MetaItem(
        originalText: "",
        spentMoneyAt: DateInRegion(region: regionChina),
        event: "",
        amount_float: 0.0
    )

    /// 临时记录输入的金额字符串（因为可能用户并没有输入小数）
    @State private var amount_string_inputting: String = ""

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
            .blur(radius: RacoonSheetConfig.shared.blurRadius)

            // 成功记账提示
            if RacoonSheetConfig.shared.showingSuccessfullyAlert {
                SuccessfullyAlert(showAddSuccessfullyAlert: $RacoonSheetConfig.shared.showingSuccessfullyAlert, metadata: RacoonAccountBook.wholeEx.items.last!.metadata)
            }

            // VoiceInputView 在 FloatingAddButton 中显示
            if selectedTab != MainView.Tab3 {
                FloatingAddButton(metadata_inputting: $metadata_inputting)
            }
        }
        .sheet(
            // 点击FloatingAddButton会弹出sheet让用户添加；语音输入结束该页面也会弹出
            isPresented: $RacoonSheetConfig.shared.showingOrdinaryAddView,
            onDismiss: didDismissOrdinaryAddSheet
        ) {
            MetaItemSheet().environmentObject(RacoonSheetConfig)
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



// struct MainView_Previews: PreviewProvider {
//    @StateObject static var PreviewAccountBook = AccountBookModel()
//
//    static var previews: some View {
//        MainView()
//            .environmentObject(PreviewAccountBook)
//    }
// }

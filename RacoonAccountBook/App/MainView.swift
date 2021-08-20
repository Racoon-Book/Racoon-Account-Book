import SwiftDate
import SwiftUI
import UIKit

struct MainView: View {
    @EnvironmentObject var RacoonAccountBook: AccountBookModel

    // TabView需要用到的东西
    private static let Tab1: String = "账本"
    private static let Tab2: String = "财记"
    private static let Tab3: String = "统计"
    /// 当前选中的Tab
    ///
    /// 默认值为打开之后呈现的Tab (默认为账本界面)
    @State private var selectedTab = MainView.Tab1

    /// 与添加相关需要用到的东西
    @State private var sheetConfig = SheetConfig(
        isShowingOrdinaryAddView: false, // 最开始不显示
        isShowingVoiceInputView: false, // 最开始不显示
        blurRadius: 0
    )

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
            .blur(radius: sheetConfig.blurRadius)

            // 成功记账提示
            if sheetConfig.showAddSuccessfullyAlert {
                SuccessfullyAddAlert(showAddSuccessfullyAlert: $sheetConfig.showAddSuccessfullyAlert, metadata: RacoonAccountBook.wholeEx.items.last!.metadata)
            }

            // VoiceInputView 在 FloatingAddButton 中显示
            if selectedTab != MainView.Tab3 {
                FloatingAddButton(sheetConfig: $sheetConfig,
                                  metadata_inputting: $metadata_inputting)
            }
        }
        .sheet(
            // 点击FloatingAddButton会弹出sheet让用户添加；语音输入结束该页面也会弹出
            isPresented: $sheetConfig.isShowingOrdinaryAddView,
            onDismiss: didDismissOrdinaryAddSheet
        ) {
            MetaItemSheet(
                sheetConfig: $sheetConfig,
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

struct SuccessfullyAddAlert: View {
    @Binding var showAddSuccessfullyAlert: Bool
    var metadata: MetaItem
    var body: some View {
        VStack {
            Text("记了一笔账")
                .foregroundColor(.black)
                .font(.system(.title))
                .padding([.horizontal, .top])

            // FIXME: 改好MetaItemView的init之后来改这个
            MetaItemView(metadata: metadata, metadata_inputting: metadata)

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

import SwiftDate
import SwiftUI

struct BookTabView: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel // FIXME: 这里应该用绑定的
    let today = DateInRegion(region: regionChina)
    let thisYear: Int = DateInRegion(region: regionChina).year
    let thisMonth: Int = DateInRegion(region: regionChina).month

    var body: some View {
        VStack {
            IncomeExpenditureView()
                .padding(10)

            Text("当月支出")
                .font(.system(.title))

            ScrollViewReader { scrollView in
                let items = RacoonAccountBook.monthlyBook[SupportedYear(rawValue: thisYear) ?? .Y2024]?
                    .monthlyEx[Month(rawValue: thisMonth) ?? .Dec]?
                    .items ?? []

                ScrollView(.vertical) {
                    LazyVStack {
                        // `id: \.self` is a must. Check https://developer.apple.com/forums/thread/667640
                        ForEach(items, id: \.self) { item in
                            MetaItemView(metadata: item.metadata)
                                .padding([.horizontal], 10)
                                .padding([.vertical], 2)
                        }
                    }
                    .onAppear {
                        // 出现的时候滑到最下面
                        scrollView.scrollTo(items[items.count - 1])
                        printLog("ScrollView: all \(items.count) and scrolled to \(items[items.count - 1]) ")
                    }
                }
            }
        }
    }
}

// struct BookTabView_Previews: PreviewProvider {
//    @StateObject static var PreviewAccountBook = AccountBookModel()
//
//    static var previews: some View {
//        BookTabView(RacoonAccountBook: PreviewAccountBook)
//    }
// }

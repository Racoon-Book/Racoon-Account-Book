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

            if let items = RacoonAccountBook.book[MyYear(rawValue: thisYear) ?? .Y2024]?
                .monthlyInEx[MyMonth(rawValue: thisMonth) ?? .Dec]?
                .items {
                ScrollViewReader { scrollView in
                    ScrollView(.vertical) {
                        LazyVStack {
                            ForEach(items) { item in
                                MetaItemView(metadata: item.metadata)
                                    .padding(10)
                            }
                        }
                        .onAppear {
                            // 出现的时候滑到最下面
                            scrollView.scrollTo(items[items.endIndex - 1])
                        }
                    }
                }
            } else {
                Text("ScrollViewReader Error")
            }
        }
    }
}

struct BookTabView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        BookTabView(RacoonAccountBook: PreviewAccountBook)
    }
}

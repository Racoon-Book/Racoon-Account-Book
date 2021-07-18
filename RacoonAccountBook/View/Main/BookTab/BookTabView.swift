import SwiftDate
import SwiftUI

struct BookTabView: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel // FIXME: 这里应该用绑定的
    let today: DateInRegion = DateInRegion(region: regionChina)
    let thisYear: Int = DateInRegion(region: regionChina).year
    let thisMonth: Int = DateInRegion(region: regionChina).month

    var body: some View {
        VStack {
            IncomeExpenditureView()
                .padding(10)

            Text("当月支出")
                .font(.system(.title))

            List {
                // 在BookTabView中只显示当月的支出详情
                if let items = RacoonAccountBook.book[MyYear(rawValue: thisYear) ?? .Y2024]?
                    .monthlyInEx[MyMonth(rawValue: thisMonth) ?? .Jan]?
                    .items {
                    ForEach(items) { item in
                        MetaItemView(metadata: item.metadata)
                    }
                }
            }
        }
    }
}

struct BookTabView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook: AccountBookModel = AccountBookModel()

    static var previews: some View {
        BookTabView(RacoonAccountBook: PreviewAccountBook)
    }
}

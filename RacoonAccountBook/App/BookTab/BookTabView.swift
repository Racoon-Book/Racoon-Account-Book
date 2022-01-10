import SwiftDate
import SwiftUI

struct BookTab: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel // FIXME: 这里应该用绑定的
    let today = DateInRegion(region: regionChina)
    let thisYear: Int = DateInRegion(region: regionChina).year
    let thisMonth: Int = DateInRegion(region: regionChina).month

    var body: some View {
        VStack {
            // TOOD: 这个之后换成月份选择下拉框
            Text("\(String(thisYear))年\(thisMonth)月 花销") // 为了不出现`,`使用`String()`
                .font(.system(.title2))

            IncomeExpenditureView()
                .padding(10)
            // TODO: 这里也许可以加个阴影？

            ScrollViewReader { scrollView in
                if let (dict, lastDayWithItems) = RacoonAccountBook.GetDayItemsInOneMonth(date: today),
                   let keys = dict.keys.sorted()
                {
                    ScrollView(.vertical) {
                        LazyVStack {
                            // Check https://stackoverflow.com/questions/56675532/swiftui-iterating-through-dictionary-with-foreach
                            // WWDC21可以替换为OrderedDictionary https://stackoverflow.com/a/68023633/14298786
                            ForEach(keys, id: \.self) { key in
                                if let day = Day(rawValue: key.rawValue),
                                   let date = DateInRegion(year: thisYear, month: thisMonth, day: day.rawValue),
                                   let ex = dict[key],
                                   let dayItems = ex.items
                                {
                                    DayItemsView(
                                        date: date,
                                        dayItems: dayItems
                                    )
                                    .padding([.horizontal], 10) // 让圆角矩形边框不靠边
                                }
                            }
                        }
                        .onAppear {
                            // 出现的时候滑到最下面
                            if let day = lastDayWithItems {
                                printLog("[BookTabView] Scrolled to day \(day.rawValue - 1)")
                                // 这里需要获取一下最后一个有值的天 然后才能滑动到对应的位置
                                scrollView.scrollTo(keys[day.rawValue - 1])
                            }
                        }
                    }
                } else {
                    Text("Error in ScrollView: nil in monthlyBook")
                }
            }
            .padding([.bottom], 10)
        }
    }
}

struct BookTabView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        BookTab(RacoonAccountBook: PreviewAccountBook)
    }
}

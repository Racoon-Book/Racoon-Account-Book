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

            Text("当月支出") // TOOD: 这个之后换成上方的月份选择下拉框
                .font(.system(.title))

            ScrollViewReader { scrollView in
                if let (dict, lastDayWithItems) = RacoonAccountBook.GetDayItemsInOneMonth(date: today),
                   let keys = dict.keys.sorted() {
                    ScrollView(.vertical) {
                        LazyVStack {
                            // Check https://stackoverflow.com/questions/56675532/swiftui-iterating-through-dictionary-with-foreach
                            // WWDC21可以替换为OrderedDictionary https://stackoverflow.com/a/68023633/14298786
                            ForEach(keys, id: \.self) { key in

                                DayItemsView(
                                    date: DateInRegion(year: thisYear, month: thisMonth,
                                                       day: Day(rawValue: key.rawValue)?.rawValue ?? 1),
                                    dayItems: dict[key]?.items ?? []
                                )
                                .padding([.horizontal], 10) // 让圆角矩形边框不靠边
                            }
                        }
                        .onAppear {
                            // 出现的时候滑到最下面
                            if let day = lastDayWithItems {
                                print("scroll::::::::: \(day.rawValue)")
                                scrollView.scrollTo(keys[day.rawValue])
                                scrollView.scrollTo(keys[18])
                                // keys[18]是可行的。这里需要获取一下最后一个有值的天
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
        BookTabView(RacoonAccountBook: PreviewAccountBook)
    }
}

import SwiftDate
import SwiftUI

struct BookTab: View {
    @FetchRequest(fetchRequest: Expense.request_expensesInLast30days)
    var expensesInLast30Days

    @FetchRequest(fetchRequest: Expense.request_expensesInLast7days)
    var expensesInLast7Days

    var body: some View {
        let today = DateInRegion(region: regionChina)
        let thisYear: Int = today.year
        let thisMonth: Int = today.month

        let cardPadding = CGFloat(10)

        NavigationView {
            VStack {
                IncomeExpenditureView(usingRelativeDays: true,
                                      sevenEx: expensesInLast7Days.sum(), // TODO: 添加本周支出
                                      sevenIn: 0,
                                      thirtyEx: expensesInLast30Days.sum(), // change to array
                                      thirtyIn: 0)
                    .padding(cardPadding)
                    // TODO: 这里也许可以加个阴影？

//                ScrollViewReader { scrollView in
//                    if
//                        let (dayItemsDict, maxDayHavingItems) = RacoonAccountBook.getExDiviedByDaysInMonth(today),
//                        let days = dayItemsDict.keys.sorted()
//                    {
//                        ScrollView(.vertical) {
//                            VStack {
//                                // Check https://stackoverflow.com/questions/56675532/swiftui-iterating-through-dictionary-with-foreach
//                                // WWDC21可以替换为OrderedDictionary https://stackoverflow.com/a/68023633/14298786
//
//                                // 一天的开销在一个圆角矩形中
//                                ForEach(days, id: \.self) { day in
//                                    if let day = Day(rawValue: day.rawValue),
//                                       let date = DateInRegion(
//                                           year: thisYear,
//                                           month: thisMonth,
//                                           day: day.rawValue,
//                                           region: regionChina
//                                       ),
//                                       let ex = dayItemsDict[day],
//                                       let dayItems = ex.items
//                                    {
//                                        DayItemsView(
//                                            date: date,
//                                            dayItems: dayItems
//                                        )
//                                        .padding([.horizontal], cardPadding) // 让圆角矩形边框不靠边
//                                    }
//                                }
//                            }
//
//                            .onAppear {
//                                // 出现的时候滑到最下面
//                                if let day = maxDayHavingItems {
//                                    printLog("[BookTabView] Scrolled to day \(day.rawValue - 1)")
//                                    // FIXME: 每次这里都会打印两次 看看是为什么
//                                    // 这里需要获取一下最后一个有值的天 然后才能滑动到对应的位置
//                                    scrollView.scrollTo(days[day.rawValue - 1])
//                                }
//                            }
//                        }
//                    } else {
//                        Text("Error in ScrollView: nil in monthlyBook")
//                    }
//                }
                    .padding([.bottom], cardPadding) // 最下方别贴着屏幕底端
            }
            .navigationTitle("\(String(thisYear))年\(thisMonth)月 花销")
            // 为了不出现`,`使用`String()`
            // TOOD: 这个之后换成月份选择下拉框
            .navigationBarTitleDisplayMode(.inline)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

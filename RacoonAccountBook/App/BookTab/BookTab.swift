import CoreData
import SwiftDate
import SwiftUI

struct BookTab: View {
    @Environment(\.managedObjectContext) private var context

    @FetchRequest(fetchRequest: Expense.request_expensesInLast30days)
    var expensesInLast30Days

    @FetchRequest(fetchRequest: Expense.request_expensesInLast7days)
    var expensesInLast7Days

    @FetchRequest var expensesInDay1: FetchedResults<Expense>
    @FetchRequest var expensesInDay2: FetchedResults<Expense>
    @FetchRequest var expensesInDay3: FetchedResults<Expense>
    @FetchRequest var expensesInDay4: FetchedResults<Expense>
    @FetchRequest var expensesInDay5: FetchedResults<Expense>
    @FetchRequest var expensesInDay6: FetchedResults<Expense>
    @FetchRequest var expensesInDay7: FetchedResults<Expense>
    @FetchRequest var expensesInDay8: FetchedResults<Expense>
    @FetchRequest var expensesInDay9: FetchedResults<Expense>
    @FetchRequest var expensesInDay10: FetchedResults<Expense>
    @FetchRequest var expensesInDay11: FetchedResults<Expense>
    @FetchRequest var expensesInDay12: FetchedResults<Expense>
    @FetchRequest var expensesInDay13: FetchedResults<Expense>
    @FetchRequest var expensesInDay14: FetchedResults<Expense>
    @FetchRequest var expensesInDay15: FetchedResults<Expense>
    @FetchRequest var expensesInDay16: FetchedResults<Expense>
    @FetchRequest var expensesInDay17: FetchedResults<Expense>
    @FetchRequest var expensesInDay18: FetchedResults<Expense>
    @FetchRequest var expensesInDay19: FetchedResults<Expense>
    @FetchRequest var expensesInDay20: FetchedResults<Expense>
    @FetchRequest var expensesInDay21: FetchedResults<Expense>
    @FetchRequest var expensesInDay22: FetchedResults<Expense>
    @FetchRequest var expensesInDay23: FetchedResults<Expense>
    @FetchRequest var expensesInDay24: FetchedResults<Expense>
    @FetchRequest var expensesInDay25: FetchedResults<Expense>
    @FetchRequest var expensesInDay26: FetchedResults<Expense>
    @FetchRequest var expensesInDay27: FetchedResults<Expense>
    @FetchRequest var expensesInDay28: FetchedResults<Expense>
    @FetchRequest var expensesInDay29: FetchedResults<Expense>
    @FetchRequest var expensesInDay30: FetchedResults<Expense>
    @FetchRequest var expensesInDay31: FetchedResults<Expense>

    init(year: Int = DateInRegion(region: regionChina).year, month: Int = DateInRegion(region: regionChina).month) {
        let request_day1 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 1, region: regionChina))
        _expensesInDay1 = FetchRequest(fetchRequest: request_day1)
        let request_day2 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 2, region: regionChina))
        _expensesInDay2 = FetchRequest(fetchRequest: request_day2)
        let request_day3 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 3, region: regionChina))
        _expensesInDay3 = FetchRequest(fetchRequest: request_day3)
        let request_day4 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 4, region: regionChina))
        _expensesInDay4 = FetchRequest(fetchRequest: request_day4)
        let request_day5 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 5, region: regionChina))
        _expensesInDay5 = FetchRequest(fetchRequest: request_day5)
        let request_day6 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 6, region: regionChina))
        _expensesInDay6 = FetchRequest(fetchRequest: request_day6)
        let request_day7 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 7, region: regionChina))
        _expensesInDay7 = FetchRequest(fetchRequest: request_day7)
        let request_day8 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 8, region: regionChina))
        _expensesInDay8 = FetchRequest(fetchRequest: request_day8)
        let request_day9 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 9, region: regionChina))
        _expensesInDay9 = FetchRequest(fetchRequest: request_day9)
        let request_day10 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 10, region: regionChina))
        _expensesInDay10 = FetchRequest(fetchRequest: request_day10)
        let request_day11 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 11, region: regionChina))
        _expensesInDay11 = FetchRequest(fetchRequest: request_day11)
        let request_day12 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 12, region: regionChina))
        _expensesInDay12 = FetchRequest(fetchRequest: request_day12)
        let request_day13 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 13, region: regionChina))
        _expensesInDay13 = FetchRequest(fetchRequest: request_day13)
        let request_day14 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 14, region: regionChina))
        _expensesInDay14 = FetchRequest(fetchRequest: request_day14)
        let request_day15 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 15, region: regionChina))
        _expensesInDay15 = FetchRequest(fetchRequest: request_day15)
        let request_day16 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 16, region: regionChina))
        _expensesInDay16 = FetchRequest(fetchRequest: request_day16)
        let request_day17 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 17, region: regionChina))
        _expensesInDay17 = FetchRequest(fetchRequest: request_day17)
        let request_day18 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 18, region: regionChina))
        _expensesInDay18 = FetchRequest(fetchRequest: request_day18)
        let request_day19 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 19, region: regionChina))
        _expensesInDay19 = FetchRequest(fetchRequest: request_day19)
        let request_day20 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 20, region: regionChina))
        _expensesInDay20 = FetchRequest(fetchRequest: request_day20)
        let request_day21 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 21, region: regionChina))
        _expensesInDay21 = FetchRequest(fetchRequest: request_day21)
        let request_day22 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 22, region: regionChina))
        _expensesInDay22 = FetchRequest(fetchRequest: request_day22)
        let request_day23 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 23, region: regionChina))
        _expensesInDay23 = FetchRequest(fetchRequest: request_day23)
        let request_day24 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 24, region: regionChina))
        _expensesInDay24 = FetchRequest(fetchRequest: request_day24)
        let request_day25 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 25, region: regionChina))
        _expensesInDay25 = FetchRequest(fetchRequest: request_day25)
        let request_day26 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 26, region: regionChina))
        _expensesInDay26 = FetchRequest(fetchRequest: request_day26)
        let request_day27 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 27, region: regionChina))
        _expensesInDay27 = FetchRequest(fetchRequest: request_day27)
        let request_day28 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 28, region: regionChina))
        _expensesInDay28 = FetchRequest(fetchRequest: request_day28)
        let request_day29 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 29, region: regionChina))
        _expensesInDay29 = FetchRequest(fetchRequest: request_day29)
        let request_day30 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 30, region: regionChina))
        _expensesInDay30 = FetchRequest(fetchRequest: request_day30)
        let request_day31 = Expense.request_expensesInDay(day: DateInRegion(year: year, month: month, day: 31, region: regionChina))
        _expensesInDay31 = FetchRequest(fetchRequest: request_day31)
    }

    var body: some View {
        let today = DateInRegion(region: regionChina)
        let thisYear: Int = today.year
        let thisMonth: Int = today.month

        let cardPadding = CGFloat(10)

        NavigationView {
            VStack {
                IncomeExpenditureView(usingRelativeDays: true,
                                      sevenEx: expensesInLast7Days.sum(),
                                      sevenIn: 0,
                                      thirtyEx: expensesInLast30Days.sum(),
                                      thirtyIn: 0)

                    .padding(cardPadding)
                // TODO: 这里也许可以加个阴影？

                ScrollViewReader { scrollView in
                    if
                        let (dayExpensesDict, maxDayHavingExpense) = Expense.getExpensesDiviedByDaysInMonth(today, context: context),
                        let days: [Day] = dayExpensesDict.keys.sorted()
                    {
                        ScrollView(.vertical) {
                            VStack {
                                // Check https://stackoverflow.com/questions/56675532/swiftui-iterating-through-dictionary-with-foreach
                                // WWDC21可以替换为OrderedDictionary https://stackoverflow.com/a/68023633/14298786

                                if maxDayHavingExpense == nil {
                                    Text("这个月还没记账呢")
                                } else {
                                    // 一天的开销在一个圆角矩形中
                                    ForEach(days, id: \.self.rawValue) { day in
                                        if let day = Day(rawValue: day.rawValue),
                                           let date = DateInRegion(
                                               year: thisYear,
                                               month: thisMonth,
                                               day: day.rawValue,
                                               region: regionChina
                                           )
                                        {
                                            // 用叹号没有风险：这里Day是枚举
                                            if dayExpensesDict[day]!.count != 0 {
                                                DayExpensesView(
                                                    date: date,
                                                    dayExpenses: dayExpensesDict[day]!
                                                )

                                                .padding([.horizontal], cardPadding) // 让圆角矩形边框不靠边
                                            } else {
                                                EmptyView()
                                            }
                                        }
                                    }
                                    // 别用这个 用正规的方法
//                                    .id(UUID()) // check https://www.reddit.com/r/SwiftUI/comments/gb28lc/swiftui_foreach_not_updating_even_though/fwesf67/
                                }
                            }

//                            .onAppear {
//                                // 出现的时候滑到最下面
//                                if let day = maxDayHavingExpense {
//                                    printLog("[\((#filePath as NSString).lastPathComponent) \(#function) line\(#line)] Scrolled to day \(day.rawValue - 1)")
//                                    // FIXME: 每次这里都会打印两次 看看是为什么
//                                    // 这里需要获取最后一个有值的天 然后才能滑动到对应的位置
//                                    scrollView.scrollTo(days[day.rawValue - 1])
//                                }
//                            }
                        }
                    } else {
                        Text("Error in ScrollView: nil in monthlyBook")
                            .onAppear {
                                printFatalError("")
                            }
                    }
                }
                .padding([.bottom], cardPadding) // 最下方别贴着屏幕底端
            }
            .navigationTitle("\(String(thisYear))年\(thisMonth)月 花销")
            // 为了不出现数字分位符`,`使用`String()`
            // TOOD: 这个之后换成月份选择下拉框
            .navigationBarTitleDisplayMode(.inline)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

import CoreData
import SwiftDate
import SwiftUI

struct BookTab: View {
    @Environment(\.managedObjectContext) private var context

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
                                      sevenEx: expensesInLast7Days.sum(),
                                      sevenIn: 0,
                                      thirtyEx: expensesInLast30Days.sum(),
                                      thirtyIn: 0)
                    .onAppear(){
                        printLog("[\((#filePath as NSString).lastPathComponent) \(#function) line\(#line)] \(expensesInLast7Days)")
                    }
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
                                    ForEach(days, id: \.self) { day in
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
                                                ).id(UUID())
                                                .padding([.horizontal], cardPadding) // 让圆角矩形边框不靠边
                                            } else {
                                                EmptyView()
                                            }
                                        }
                                    }
                                }
                            }

                            .onAppear {
                                // 出现的时候滑到最下面
                                if let day = maxDayHavingExpense {
                                    printLog("[\((#filePath as NSString).lastPathComponent) \(#function) line\(#line)] Scrolled to day \(day.rawValue - 1)")
                                    // FIXME: 每次这里都会打印两次 看看是为什么
                                    // 这里需要获取最后一个有值的天 然后才能滑动到对应的位置
                                    scrollView.scrollTo(days[day.rawValue - 1])
                                }
                            }
                        }
                    } else {
                        Text("Error in ScrollView: nil in monthlyBook")
                            .onAppear(){
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

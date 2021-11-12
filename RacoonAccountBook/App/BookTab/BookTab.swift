import CoreData
import SwiftDate
import SwiftUI

struct BookTab: View {
    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel

    @Environment(\.managedObjectContext) private var context

    @FetchRequest(fetchRequest: Expense.request_expensesInLast30days)
    var expensesInLast30Days

    @FetchRequest(fetchRequest: Expense.request_expensesInLast7days)
    var expensesInLast7Days

    private let year: Int
    private let month: Int

    private let onSideMenuOpen: () -> Void
    private let onSideMenuClose: () -> Void
    private let isSideMenuOpen: Bool

    @FetchRequest var expensesInMonth: FetchedResults<Expense>

    // --- 31 ---

    private let day1: DateInRegion
    private let day2: DateInRegion
    private let day3: DateInRegion
    private let day4: DateInRegion
    private let day5: DateInRegion
    private let day6: DateInRegion
    private let day7: DateInRegion
    private let day8: DateInRegion
    private let day9: DateInRegion
    private let day10: DateInRegion
    private let day11: DateInRegion
    private let day12: DateInRegion
    private let day13: DateInRegion
    private let day14: DateInRegion
    private let day15: DateInRegion
    private let day16: DateInRegion
    private let day17: DateInRegion
    private let day18: DateInRegion
    private let day19: DateInRegion
    private let day20: DateInRegion
    private let day21: DateInRegion
    private let day22: DateInRegion
    private let day23: DateInRegion
    private let day24: DateInRegion
    private let day25: DateInRegion
    private let day26: DateInRegion
    private let day27: DateInRegion
    private let day28: DateInRegion
    private let day29: DateInRegion
    private let day30: DateInRegion
    private let day31: DateInRegion

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

    init(year: Int = DateInRegion(region: regionChina).year,
         month: Int = DateInRegion(region: regionChina).month,
         onSideMenuOpen: @escaping () -> Void,
         onSideMenuClose: @escaping () -> Void,
         isSideMenuOpen: Bool)
    {
        self.year = year
        self.month = month

        self.onSideMenuOpen = onSideMenuOpen
        self.onSideMenuClose = onSideMenuClose
        self.isSideMenuOpen = isSideMenuOpen

        let request_expensesInMonth = Expense.request_expensesInMonth(DateInRegion(year: year, month: month, day: 1, region: regionChina))
        _expensesInMonth = FetchRequest(fetchRequest: request_expensesInMonth)

        // --- 31 ---

        day1 = DateInRegion(year: year, month: month, day: 1, region: regionChina)
        let request_day1 = Expense.request_expensesInDay(day: day1)
        _expensesInDay1 = FetchRequest(fetchRequest: request_day1)
        day2 = DateInRegion(year: year, month: month, day: 2, region: regionChina)
        let request_day2 = Expense.request_expensesInDay(day: day2)
        _expensesInDay2 = FetchRequest(fetchRequest: request_day2)
        day3 = DateInRegion(year: year, month: month, day: 3, region: regionChina)
        let request_day3 = Expense.request_expensesInDay(day: day3)
        _expensesInDay3 = FetchRequest(fetchRequest: request_day3)
        day4 = DateInRegion(year: year, month: month, day: 4, region: regionChina)
        let request_day4 = Expense.request_expensesInDay(day: day4)
        _expensesInDay4 = FetchRequest(fetchRequest: request_day4)
        day5 = DateInRegion(year: year, month: month, day: 5, region: regionChina)
        let request_day5 = Expense.request_expensesInDay(day: day5)
        _expensesInDay5 = FetchRequest(fetchRequest: request_day5)
        day6 = DateInRegion(year: year, month: month, day: 6, region: regionChina)
        let request_day6 = Expense.request_expensesInDay(day: day6)
        _expensesInDay6 = FetchRequest(fetchRequest: request_day6)
        day7 = DateInRegion(year: year, month: month, day: 7, region: regionChina)
        let request_day7 = Expense.request_expensesInDay(day: day7)
        _expensesInDay7 = FetchRequest(fetchRequest: request_day7)
        day8 = DateInRegion(year: year, month: month, day: 8, region: regionChina)
        let request_day8 = Expense.request_expensesInDay(day: day8)
        _expensesInDay8 = FetchRequest(fetchRequest: request_day8)
        day9 = DateInRegion(year: year, month: month, day: 9, region: regionChina)
        let request_day9 = Expense.request_expensesInDay(day: day9)
        _expensesInDay9 = FetchRequest(fetchRequest: request_day9)
        day10 = DateInRegion(year: year, month: month, day: 10, region: regionChina)
        let request_day10 = Expense.request_expensesInDay(day: day10)
        _expensesInDay10 = FetchRequest(fetchRequest: request_day10)
        day11 = DateInRegion(year: year, month: month, day: 11, region: regionChina)
        let request_day11 = Expense.request_expensesInDay(day: day11)
        _expensesInDay11 = FetchRequest(fetchRequest: request_day11)
        day12 = DateInRegion(year: year, month: month, day: 12, region: regionChina)
        let request_day12 = Expense.request_expensesInDay(day: day12)
        _expensesInDay12 = FetchRequest(fetchRequest: request_day12)
        day13 = DateInRegion(year: year, month: month, day: 13, region: regionChina)
        let request_day13 = Expense.request_expensesInDay(day: day13)
        _expensesInDay13 = FetchRequest(fetchRequest: request_day13)
        day14 = DateInRegion(year: year, month: month, day: 14, region: regionChina)
        let request_day14 = Expense.request_expensesInDay(day: day14)
        _expensesInDay14 = FetchRequest(fetchRequest: request_day14)
        day15 = DateInRegion(year: year, month: month, day: 15, region: regionChina)
        let request_day15 = Expense.request_expensesInDay(day: day15)
        _expensesInDay15 = FetchRequest(fetchRequest: request_day15)
        day16 = DateInRegion(year: year, month: month, day: 16, region: regionChina)
        let request_day16 = Expense.request_expensesInDay(day: day16)
        _expensesInDay16 = FetchRequest(fetchRequest: request_day16)
        day17 = DateInRegion(year: year, month: month, day: 17, region: regionChina)
        let request_day17 = Expense.request_expensesInDay(day: day17)
        _expensesInDay17 = FetchRequest(fetchRequest: request_day17)
        day18 = DateInRegion(year: year, month: month, day: 18, region: regionChina)
        let request_day18 = Expense.request_expensesInDay(day: day18)
        _expensesInDay18 = FetchRequest(fetchRequest: request_day18)
        day19 = DateInRegion(year: year, month: month, day: 19, region: regionChina)
        let request_day19 = Expense.request_expensesInDay(day: day19)
        _expensesInDay19 = FetchRequest(fetchRequest: request_day19)
        day20 = DateInRegion(year: year, month: month, day: 20, region: regionChina)
        let request_day20 = Expense.request_expensesInDay(day: day20)
        _expensesInDay20 = FetchRequest(fetchRequest: request_day20)
        day21 = DateInRegion(year: year, month: month, day: 21, region: regionChina)
        let request_day21 = Expense.request_expensesInDay(day: day21)
        _expensesInDay21 = FetchRequest(fetchRequest: request_day21)
        day22 = DateInRegion(year: year, month: month, day: 22, region: regionChina)
        let request_day22 = Expense.request_expensesInDay(day: day22)
        _expensesInDay22 = FetchRequest(fetchRequest: request_day22)
        day23 = DateInRegion(year: year, month: month, day: 23, region: regionChina)
        let request_day23 = Expense.request_expensesInDay(day: day23)
        _expensesInDay23 = FetchRequest(fetchRequest: request_day23)
        day24 = DateInRegion(year: year, month: month, day: 24, region: regionChina)
        let request_day24 = Expense.request_expensesInDay(day: day24)
        _expensesInDay24 = FetchRequest(fetchRequest: request_day24)
        day25 = DateInRegion(year: year, month: month, day: 25, region: regionChina)
        let request_day25 = Expense.request_expensesInDay(day: day25)
        _expensesInDay25 = FetchRequest(fetchRequest: request_day25)
        day26 = DateInRegion(year: year, month: month, day: 26, region: regionChina)
        let request_day26 = Expense.request_expensesInDay(day: day26)
        _expensesInDay26 = FetchRequest(fetchRequest: request_day26)
        day27 = DateInRegion(year: year, month: month, day: 27, region: regionChina)
        let request_day27 = Expense.request_expensesInDay(day: day27)
        _expensesInDay27 = FetchRequest(fetchRequest: request_day27)
        day28 = DateInRegion(year: year, month: month, day: 28, region: regionChina)
        let request_day28 = Expense.request_expensesInDay(day: day28)
        _expensesInDay28 = FetchRequest(fetchRequest: request_day28)
        day29 = DateInRegion(year: year, month: month, day: 29, region: regionChina)
        let request_day29 = Expense.request_expensesInDay(day: day29)
        _expensesInDay29 = FetchRequest(fetchRequest: request_day29)
        day30 = DateInRegion(year: year, month: month, day: 30, region: regionChina)
        let request_day30 = Expense.request_expensesInDay(day: day30)
        _expensesInDay30 = FetchRequest(fetchRequest: request_day30)
        day31 = DateInRegion(year: year, month: month, day: 31, region: regionChina)
        let request_day31 = Expense.request_expensesInDay(day: day31)
        _expensesInDay31 = FetchRequest(fetchRequest: request_day31)
    }

    var body: some View {
        let today = DateInRegion(region: regionChina)
        let thisYear: Int = today.year
        let thisMonth: Int = today.month

        let cardPadding = CGFloat(10)

        VStack {
            IncomeExpenditureView(usingRelativeDays: true,
                                  sevenEx: expensesInLast7Days.sum(),
                                  sevenIn: 0,
                                  thirtyEx: expensesInLast30Days.sum(),
                                  thirtyIn: 0)

                .padding(cardPadding)
            // TODO: 这里也许可以加个阴影？

            ScrollViewReader { _ in

                ScrollView(.vertical) {
                    ZStack {
                        // Check https://stackoverflow.com/questions/56675532/swiftui-iterating-through-dictionary-with-foreach
                        // WWDC21可以替换为OrderedDictionary https://stackoverflow.com/a/68023633/14298786

                        if expensesInMonth.count == 0 {
                            VStack {
                                Text("这个月没有记账呢")
                                    .padding()

                                Text("长按").font(.system(.title2)) +
                                    Text("右下角加号") +
                                    Text("语音输入")
                                    .font(.system(.title2, design: .rounded))

                                Text("点按").font(.system(.title2)) +
                                    Text("右下角加号") +
                                    Text("手动输入")
                                    .font(.system(.title2, design: .rounded))

                                Text("点按").font(.system(.title2)) +
                                    Text("右上角按钮") +
                                    Text("截图导入账单")
                                    .font(.system(.title2, design: .rounded))
                            }.padding()

                        } else {
                            VStack {
                                VStack {
                                    DayExpensesView(date: day1, dayExpenses: expensesInDay1)
                                    DayExpensesView(date: day2, dayExpenses: expensesInDay2)
                                    DayExpensesView(date: day3, dayExpenses: expensesInDay3)
                                    DayExpensesView(date: day4, dayExpenses: expensesInDay4)
                                    DayExpensesView(date: day5, dayExpenses: expensesInDay5)
                                    DayExpensesView(date: day6, dayExpenses: expensesInDay6)
                                    DayExpensesView(date: day7, dayExpenses: expensesInDay7)
                                    DayExpensesView(date: day8, dayExpenses: expensesInDay8)
                                    DayExpensesView(date: day9, dayExpenses: expensesInDay9)
                                }
                                VStack {
                                    DayExpensesView(date: day10, dayExpenses: expensesInDay10)
                                    DayExpensesView(date: day11, dayExpenses: expensesInDay11)
                                    DayExpensesView(date: day12, dayExpenses: expensesInDay12)
                                    DayExpensesView(date: day13, dayExpenses: expensesInDay13)
                                    DayExpensesView(date: day14, dayExpenses: expensesInDay14)
                                    DayExpensesView(date: day15, dayExpenses: expensesInDay15)
                                    DayExpensesView(date: day16, dayExpenses: expensesInDay16)
                                    DayExpensesView(date: day17, dayExpenses: expensesInDay17)
                                    DayExpensesView(date: day18, dayExpenses: expensesInDay18)
                                }
                                VStack {
                                    DayExpensesView(date: day19, dayExpenses: expensesInDay19)
                                    DayExpensesView(date: day20, dayExpenses: expensesInDay20)
                                    DayExpensesView(date: day21, dayExpenses: expensesInDay21)
                                    DayExpensesView(date: day22, dayExpenses: expensesInDay22)
                                    DayExpensesView(date: day23, dayExpenses: expensesInDay23)
                                    DayExpensesView(date: day24, dayExpenses: expensesInDay24)
                                    DayExpensesView(date: day25, dayExpenses: expensesInDay25)
                                    DayExpensesView(date: day26, dayExpenses: expensesInDay26)
                                    DayExpensesView(date: day27, dayExpenses: expensesInDay27)
                                }
                                VStack {
                                    DayExpensesView(date: day28, dayExpenses: expensesInDay28)
                                    DayExpensesView(date: day29, dayExpenses: expensesInDay29)
                                    DayExpensesView(date: day30, dayExpenses: expensesInDay30)
                                    DayExpensesView(date: day31, dayExpenses: expensesInDay31)
                                }
                            }
                        }
                    }
                    .padding([.horizontal], cardPadding) // 让圆角矩形边框不靠边
//                    .padding([.vertical], 1) // 白色的圆角矩形互相别挨着
                }
            }
            .padding([.bottom], cardPadding) // 最下方别贴着屏幕底端
        }
        .background(defaultColorSet.tabBackground.ignoresSafeArea())

        // 为了不出现数字分位符`,`使用`String()`
        // TOOD: 这个之后换成月份选择下拉框
        .navigationTitle("\(String(thisYear))年\(thisMonth)月 花销")
        .navigationBarTitleDisplayMode(.inline)

        // MARK: - 截图导入

        .navigationBarItems(
            leading:
            isSideMenuOpen ?
                Button(action: { onSideMenuClose() }) { Image(systemName: "xmark.circle") } :
                Button(action: { onSideMenuOpen() }) { Image(systemName: "line.horizontal.3") },
            // 右边有一个按钮
            trailing:
            Button(action: {
                print(Log().string + "Clicked")
                RacoonSheetConfig.shared.showingScreenshotImportSheet.toggle()
                // TODO: 弹出Sheet来添加截图
            }) { Text("截图导入") }
        )
        .sheet(
            // 点击FloatingAddButton会弹出sheet让用户添加；语音输入结束该页面也会弹出
            isPresented: $RacoonSheetConfig.shared.showingScreenshotImportSheet,
            onDismiss: didDismissScreenshotImportSheet
        ) {
            ScreenshotImportSheet()
                .environmentObject(RacoonSheetConfig)
                .environment(\.managedObjectContext, context)
        }
    }

    private func didDismissScreenshotImportSheet() {
        print(Log().string + "Dismissed")
    }
}

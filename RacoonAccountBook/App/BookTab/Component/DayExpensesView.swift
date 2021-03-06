import SwiftDate
import SwiftUI

struct DayExpensesView: View {
    @Environment(\.managedObjectContext) private var context

    var date: Date
    @FetchRequest var dayExpenses: FetchedResults<Expense>

    init(date: Date) {
        self.date = date
        let request = Expense.request_expensesInDay(day: date)
        _dayExpenses = FetchRequest(fetchRequest: request)
    }

    var body: some View {
        let date_display: String = DisplayDate(date)

        if dayExpenses.count != 0 {
            ZStack {
                // 浅色圆角矩形背景
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(defaultColorSet.cardBackground)

                // 一天的所有花销条目列出来
                VStack(alignment: .leading) {
                    Text(date_display)
                        .padding([.top], 10) // 日期上面的padding
                        .font(.system(.title3))
                        .foregroundColor(defaultColorSet.bookTabTitle)

                    ForEach(dayExpenses) { expense in
                        ExpenseView(expenseInfo: expense.expenseInfo,
                                    uuidOfExpenseToEdit: expense.uuid)
                            .padding([.top], 6) // 不同 ExpenseView 之间上下
                    }
                }
                .padding([.horizontal], 10) // 日期和花销两边的padding
                .padding([.bottom], 10) // 最后一个条目下面的padding
            }
        } else {
            EmptyView() // 不显示没有items的天
        }
    }
}

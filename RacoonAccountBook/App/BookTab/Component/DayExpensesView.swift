import SwiftDate
import SwiftUI

struct DayExpensesView: View {
    @Environment(\.managedObjectContext) private var context

    var date: DateInRegion
    var dayExpenses: FetchedResults<Expense>

    var body: some View {
        let date_display: String = DisplayDate(date)

        if dayExpenses.count != 0 {
            ZStack {
                // 浅色圆角矩形背景
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color("AntiqueWhite"))

                // 一天的所有花销条目列出来
                VStack(alignment: .leading) {
                    Text(date_display)
                        .padding([.top], 10) // 日期上面的padding
                        .font(.system(.title2))
                    

                    ForEach(dayExpenses, id: \.self) { expense in
                        // TODO: 一天内的花销按添加顺序排列
                        // FIXME: 修改之后要刷新
                        
                        ExpenseView(
                            expenseInfo: expense.expenseInfo,
                            uuidOfItemToEdit: expense.uuid)
                            
                            .padding([.top], 6) // 不同 MetaItemView 之间上下
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

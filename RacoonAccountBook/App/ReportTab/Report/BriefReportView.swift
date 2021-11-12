// BriefReportView.swift

import SwiftUI

struct BriefReportView: View {
    @Environment(\.managedObjectContext) var context

    @FetchRequest(fetchRequest: Expense.request_allExpenses)
    var expenses_all
    @FetchRequest(fetchRequest: Expense.request_expensesInThisMonth)
    var expenses_thisMonth

    var body: some View {
        CardSeperatorView(title: "本月花销",
                          contentView: AnyView(
                              ExReportCardContent(
                                  expenseSum: expenses_thisMonth.sum(),
                                  expenseCount: expenses_thisMonth.count,
                                  maxExpense: expenses_thisMonth.max_expense(),
                                  isMonth: true)))
        CardSeperatorView(title: "历史花销",
                          contentView: AnyView(
                              ExReportCardContent(
                                  expenseSum: expenses_all.sum(),
                                  expenseCount: expenses_all.count,
                                  maxExpense: expenses_all.max_expense(),
                                  isMonth: false)
                          ))
    }
}

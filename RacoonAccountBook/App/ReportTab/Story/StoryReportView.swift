// HabitView.swift

import SwiftUI

struct StoryReportView: View {
    @Environment(\.managedObjectContext) var context

    @FetchRequest(fetchRequest: Expense.request_allExpenses)
    var expenses
    @FetchRequest(fetchRequest: Expense.request_expensesInLast30days)
    var expenseInLast30days

    @FetchRequest(fetchRequest: Expense.request_allExpensesWithStory)
    var expensesWithStory

    var body: some View {
        CardSeperatorView(title: "近日记录", contentView: AnyView(HabitThirtyReportCardContent(expenseCount: expenseInLast30days.count)))
        CardSeperatorView(title: "历史记录", contentView: AnyView(HabitHistoryReportCardContent(expenseCount: expenses.count)))
        CardSeperatorView(title: "财记统计", contentView: AnyView(StoryReportCardContent(storyCount: expensesWithStory.count)))
    }
}

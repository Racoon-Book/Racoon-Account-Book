// HabitView.swift

import SwiftUI

struct StoryReportView: View {
    @Environment(\.managedObjectContext) var context

    @FetchRequest(fetchRequest: Expense.request_allExpensesWithStory)
    var expensesWithStory
    @FetchRequest(fetchRequest: Expense.request_allExpenses)
    var expenses

    var body: some View {
        CardSeperatorView(title: "习惯统计", contentView: AnyView(HabitReportCardContent(expenseCount: expenses.count)))
        CardSeperatorView(title: "财记统计", contentView: AnyView(StoryReportCardContent(storyCount: expensesWithStory.count)))
    }
}

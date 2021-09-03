// Expense+FetchData.swift

import CoreData
import Foundation

extension Expense {
    // MARK: - FetchData

    static func getAllExpenses(context: NSManagedObjectContext, story_only: Bool = false) -> [Expense] {
        let expenses = try? context.fetch(story_only ? request_allExpensesWithStory : request_allExpensesWithStory)
        return expenses ?? []
    }
}

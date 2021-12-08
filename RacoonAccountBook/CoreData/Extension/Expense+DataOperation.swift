import CoreData
import Foundation
import SwiftDate

extension Expense {
    // MARK: - DataOperation

    static func create(expenseInfo: ExpenseInfo, context: NSManagedObjectContext) {
        let expense = Expense(context: context)

        // Expense

        //   - system: uuid createdAt updatedAt
        expense.uuid = UUID()
        expense.createdAt = Date()
        expense.updatedAt = Date()

        //   - properties: spentAt event amount
        //   - other: originalText?
        //   - relationship: story? focus generatedTags tags forWho
        expense.expenseInfo = expenseInfo

        expense.objectWillChange.send()

        expense.focus?.objectWillChange.send()
        expense.story?.objectWillChange.send()
        expense.forWho.forEach {
            $0.objectWillChange.send()
        }
        expense.tags.forEach {
            $0.objectWillChange.send()
        }

        try? context.save()
    }

    static func delete(uuid: UUID, context: NSManagedObjectContext) -> Bool {
        if let expenses = try? context.fetch(Expense.request_expenseBy(uuid: uuid)) {
            if let expense = expenses.first {
                if let story = expense.story {
                    context.delete(story)
                }
                context.delete(expense)

                // TODO: 当forWho没有其他expense时，删除
            }

            try? context.save()
            return true
        } else {
            return false
        }
    }

    static func updateBy(uuid: UUID, expenseInfo: ExpenseInfo,
                         context: NSManagedObjectContext) -> Bool
    {
        if let expenses = try? context.fetch(Expense.request_expenseBy(uuid: uuid)) {
            //   - system
            expenses.first!.updatedAt = Date()

            //   - properties: spentAt event amount
            //   - other: originalText?
            //   - relationship: story? focus generatedTags tags forWho
            expenses.first!.expenseInfo = expenseInfo

            expenses.first!.objectWillChange.send()

            expenses.first!.focus?.objectWillChange.send()
            expenses.first!.story?.objectWillChange.send()
            expenses.first!.forWho.forEach {
                $0.objectWillChange.send()
            }
            expenses.first!.tags.forEach {
                $0.objectWillChange.send()
            }

            do {
                try context.save()
                return true
            } catch {
                return false
            }
        } else {
            return false
        }
    }
}

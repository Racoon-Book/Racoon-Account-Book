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
        expense.createdAt = DateInRegion(region: regionChina)
        expense.updatedAt = DateInRegion(region: regionChina)

        //   - properties: spentAt event amount
        //   - other: originalText?
        //   - relationship: story? focus generatedTags tags forWho
        expense.expenseInfo = expenseInfo

        expense.objectWillChange.send()

        try? context.save()
    }

    static func updateBy(uuid: UUID, expenseInfo: ExpenseInfo,
                         context: NSManagedObjectContext) -> Bool
    {
        if let expenses = try? context.fetch(Expense.request_expenseBy(uuid: uuid)) {
            //   - system
            expenses.first!.updatedAt = DateInRegion(region: regionChina)

            //   - properties: spentAt event amount
            //   - other: originalText?
            //   - relationship: story? focus generatedTags tags forWho
            expenses.first!.expenseInfo = expenseInfo

            expenses.first!.objectWillChange.send()

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

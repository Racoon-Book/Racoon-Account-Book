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
        printLog("[\((#filePath as NSString).lastPathComponent) \(#function) line\(#line)] 传入的expenseInfo\(expenseInfo)")
        do {
            let expenses = try context.fetch(Expense.request_expenseBy(uuid: uuid))

            // - system
            expenses.first!.updatedAt = DateInRegion(region: regionChina)

            //   - properties: spentAt event amount
            //   - other: originalText?
            //   - relationship: story? focus generatedTags tags forWho
            expenses.first!.expenseInfo = expenseInfo // TODO: 这样就可以修改了吗？
            printLog("[\((#filePath as NSString).lastPathComponent) \(#function) line\(#line)] 修改后的expenseInfo\(expenses.first!.expenseInfo)")
            expenses.first!.event_ = expenseInfo.event

            expenses.first!.objectWillChange.send()

            do {
                try context.save()

                return true
            } catch {
                print("error 1")
                return false
            }

        } catch {
            let fetchError = error as NSError
            printError(fetchError)
        }

        return false
    }
}

import CoreData
import Foundation
import SwiftDate

extension Expense {
    // MARK: - fetch requests
    
    static var request_allExpenses: NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: false)]
        return request
    }
    
    static var request_allExpensesWithStory: NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: false)]
        request.predicate = NSPredicate(format: "story != nil")
        return request
    }
    
    // MARK: - fetch data
    
    static func getAllExpenses(context: NSManagedObjectContext, story_only: Bool = false) -> [Expense] {
        let expenses = try? context.fetch(story_only ? request_allExpensesWithStory : request_allExpensesWithStory)
        return expenses ?? []
    }

    // MARK: - access
    
    // Expense: 

    var createdAt: DateInRegion {
        get { createdAt_!.convertTo(region: regionChina) }
        set { createdAt_ = newValue.date }
    }
    
    var updatedAt: DateInRegion {
        get { updatedAt_!.convertTo(region: regionChina) }
        set { updatedAt_ = newValue.date }
    }
    
    var spentAt: DateInRegion {
        get { spentAt_!.convertTo(region: regionChina) }
        set { spentAt_ = newValue.date }
    }
    
    var event: String {
        get {
            if event_ != nil {
                return event_!
            } else {
                print("未获取到event")
                return ""
            }
        }
        set { event_ = newValue }
    }

    // MARK: - operation
    
    static func create(expenseInfo: ExpenseInfo, context: NSManagedObjectContext) {
        let expense = Expense(context: context)
        
        expense.originalText = expenseInfo.originalText
        // FIXME: convert DateInRegion to Date
        expense.spentAt = expenseInfo.spentMoneyAt
        expense.event = expenseInfo.event
        expense.amount = expenseInfo.amount_float
        
        if expenseInfo.story != nil {
            expense.story = Story.create(story: expenseInfo.story!, context: context)
        }
        
        expense.objectWillChange.send()
        try? context.save()
    }

    // MARK: - analysis

    static func continous_days(context: NSManagedObjectContext) -> [DateInRegion] {
        let all_expenses = Expense.getAllExpenses(context: context)
        var days = [DateInRegion]()
        // 明天
        var last_day = DateInRegion(region: regionChina).dateAt(.startOfDay) + 1.days
        
        for expense in all_expenses {
            let now_day = expense.spentAt.dateAt(.startOfDay)
            if now_day == last_day {
                continue
            } else if now_day + 1.days == last_day {
                days.append(now_day)
                last_day = now_day
            } else {
                break
            }
        }
        
        return days
    }
}

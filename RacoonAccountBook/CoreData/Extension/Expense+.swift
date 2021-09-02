import CoreData
import Foundation
import SwiftDate

extension Expense {
    // MARK: - fetch requests
    
    // MARK: - fetch data
    
    static func getAddExpenses(context: NSManagedObjectContext, story_only: Bool = false) -> [Expense] {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: false)]
        if story_only {
            request.predicate = NSPredicate(format: "story != nil")
        }
        return (try? context.fetch(request)) ?? []
    }
    
    static func last_month(context: NSManagedObjectContext, story_only: Bool = false) -> [Expense] {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: false)]
        
        // TODO: Date
        request.predicate = NSPredicate(format: "spentAt_ > %@", Date() - 1.months as NSDate)
        if story_only {
            request.predicate = NSPredicate(format: "story != nil")
        }
        return (try? context.fetch(request)) ?? []
    }

    // MARK: - access

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
        get { event_ ?? "暂无事件" }
        set { event_ = newValue }
    }

    // MARK: - operation
    
    static func create(context: NSManagedObjectContext, expenseInfo: ExpenseInfo) {
        let expense = Expense(context: context)
        
        expense.originalText = expenseInfo.originalText
        // FIXME: convert DateInRegion to Date
        expense.spentAt = expenseInfo.spentMoneyAt
        expense.event = expenseInfo.event
        expense.amount = expenseInfo.amount_float
        
        if expenseInfo.story != nil {
            expense.story = Story.create(context: context, story: expenseInfo.story!)
        }
        
        expense.objectWillChange.send()
        try? context.save()
    }

    // MARK: - analysis

    static func continous_days(context: NSManagedObjectContext) -> [DateInRegion] {
        let all_expenses = Expense.getAddExpenses(context: context)
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

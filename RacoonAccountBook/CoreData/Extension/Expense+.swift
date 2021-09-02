import CoreData
import Foundation
import SwiftDate

extension Expense {
    // MARK: Access
    
    static func all(context: NSManagedObjectContext, story_only: Bool = false) -> [Expense] {
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
    
    static func continous_days(context: NSManagedObjectContext) -> [DateInRegion] {
        let all_expenses = Expense.all(context: context)
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
    
    // MARK: Update
    
    static func create(context: NSManagedObjectContext, metadata: ExpenseInfo) {
        let expense = Expense(context: context)
        
        expense.originalText = metadata.originalText
        // FIXME: convert DateInRegion to Date
        expense.spentAt = metadata.spentMoneyAt
        expense.event = metadata.event
        expense.amount = metadata.amount_float
        
        if metadata.story != nil {
            expense.story = Story.create(context: context, story: metadata.story!)
        }
        
        expense.objectWillChange.send()
        try? context.save()
    }
    
    // Properties
    
    var createdAt: DateInRegion {
        get { createdAt_?.convertTo(region: regionChina) ?? DateInRegion("1970-01-01 00:00:00", region: regionChina)! }
        set { createdAt_ = newValue.date }
    }
    
    var updatedAt: DateInRegion {
        get { updatedAt_?.convertTo(region: regionChina) ?? DateInRegion("1970-01-01 00:00:00", region: regionChina)! }
        set { updatedAt_ = newValue.date }
    }
    
    var spentAt: DateInRegion {
        get { spentAt_?.convertTo(region: regionChina) ?? DateInRegion("1970-01-01 00:00:00", region: regionChina)! }
        set { spentAt_ = newValue.date }
    }
    
    var event: String {
        get { event_ ?? "暂无事件" }
        set { event_ = newValue }
    }
}

extension Array where Element: Expense {
    func sum() -> Float {
        return self.reduce(0.0) { $0 + $1.amount }
    }
    
    func max_amount() -> Float? {
        return self.max_expense()?.amount
    }
    
    func max_expense() -> Expense? {
        return self.max { $0.amount < $1.amount }
    }
    
    func story_only() -> [Expense] {
        return self.filter { $0.story != nil }
    }
    
    func days() -> [DateInRegion] {
        // 将 expense 的时间设为当天的起始时间
        let raw_days = self.map { $0.spentAt.dateAt(.startOfDay) }
        let days = raw_days.enumerated().filter { index, day in
            index == raw_days.firstIndex(of: day)
        }
        
        return days.map { $0.element }
    }
}

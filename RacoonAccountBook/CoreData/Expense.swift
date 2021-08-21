import CoreData
import SwiftDate

extension Expense {
    
    // MARK: Access
    
    static func all(context: NSManagedObjectContext, story_only: Bool = false) -> [Expense] {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        if (story_only) {
            request.predicate = NSPredicate(format: "story != nil")
        }
        return (try? context.fetch(request)) ?? []
    }
    
    static func last_month(context: NSManagedObjectContext, story_only: Bool = false) -> [Expense] {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        
        // TODO: Date
        request.predicate = NSPredicate(format: "spentAt_ > %@", Date() - 1.months as NSDate)
        if (story_only) {
            request.predicate = NSPredicate(format: "story != nil")
        }
        return (try? context.fetch(request)) ?? []
    }
    
    // MARK: Update
    
    static func create(context: NSManagedObjectContext, metadata: MetaItem) {
        let expense = Expense(context: context)
        
        expense.originalText = metadata.originalText
        // FIXME: convert DateInRegion to Date
        expense.spentAt = metadata.spentMoneyAt
        expense.event = metadata.event
        expense.amount = metadata.amount_float
        
        if (metadata.story != nil) {
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

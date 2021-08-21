import CoreData
import SwiftDate

extension Expense {
    
    // MARK: Access
    
    static func all(context: NSManagedObjectContext) -> [Expense] {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        return (try? context.fetch(request)) ?? []
    }
    
    static func last_month(context: NSManagedObjectContext) -> [Expense] {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        
        // TODO: Date
        request.predicate = NSPredicate(format: "spentAt > %@", Date() - 1.months as NSDate)
        return (try? context.fetch(request)) ?? []
    }
    
    // MARK: Update
    
    static func create(context: NSManagedObjectContext, metadata: MetaItem) {
        let expense = Expense(context: context)
        
        expense.originalText = metadata.originalText
        // FIXME: convert DateInRegion to Date
        expense.spentAt = Date()
        expense.event = metadata.event
        expense.amount_float = metadata.amount_float
        
        if (metadata.story != nil) {
            expense.story = Story.create(context: context, story: metadata.story!)
        }
        
        expense.objectWillChange.send()
        try? context.save()
        printLog("add expense")
    }
}

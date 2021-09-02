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
        request.predicate = NSPredicate(format: "story_ != nil")
        return request
    }
    
    // MARK: - fetch data
    
    static func getAllExpenses(context: NSManagedObjectContext, story_only: Bool = false) -> [Expense] {
        let expenses = try? context.fetch(story_only ? request_allExpensesWithStory : request_allExpensesWithStory)
        return expenses ?? []
    }

    // MARK: - access
    
    // Expense
    //   - system: createdAt updatedAt
    //   - properties: spentAt event amount
    //   - other: originalText?
    //   - relationship: generatedTags tags focus forWho story?
    // 注：列表不会是nil 判空即可

    // system
    
    var createdAt: DateInRegion {
        get {
            if createdAt_ != nil {
                return createdAt_!.convertTo(region: regionChina)
            } else {
                print("未获取到createdAt_")
                return DateInRegion(region: regionChina)
            }
        }
        set { createdAt_ = newValue.date }
    }
    
    var updatedAt: DateInRegion {
        get {
            if updatedAt_ != nil {
                return updatedAt_!.convertTo(region: regionChina)
            } else {
                print("未获取到updatedAt_")
                return DateInRegion(region: regionChina)
            }
        }
        set { updatedAt_ = newValue.date }
    }
    
    // properties
    
    var spentAt: DateInRegion {
        get {
            if spentAt_ != nil {
                return spentAt_!.convertTo(region: regionChina)
            } else {
                print("未获取到spentAt_")
                return DateInRegion(region: regionChina)
            }
        }
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
    
    var amount: Float {
        get {
            return amount_
        }
        set { amount_ = newValue }
    }
    
    // other
    
    var originalText: String? {
        get { originalText_ }
        set { event_ = newValue }
    }
    
    // relationship
    
    var story: Story? {
        get { story_ }
        set { story_ = newValue }
    }
    
//    var flights: Set<Flight> {
//        get { (flights_ as? Set<Flight>) ?? [] }
//        set { flights_ = newValue as NSSet }
//    }
    
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

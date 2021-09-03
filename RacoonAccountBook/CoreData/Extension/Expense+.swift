import CoreData
import Foundation
import SwiftDate

extension Expense {
    // MARK: - fetch requests
    
    static var request_allExpenses: NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: true)]
        return request
    }
    
    static var request_allExpensesWithStory: NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: false)]
        request.predicate = NSPredicate(format: "story_ != nil")
        return request
    }
    
    static var request_expensesInLast30days: NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: true)]
        request.predicate = NSPredicate(
            format: "spentAt_ > %@ and spentAt_ < %@",
            (DateInRegion(region: regionChina) - 30.days).date as NSDate,
            DateInRegion(region: regionChina).date as NSDate)
        return request
    }
    
    static var request_expensesInLast7days: NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: true)]
        request.predicate = NSPredicate(
            format: "spentAt_ > %@ and spentAt_ < %@",
            (DateInRegion(region: regionChina) - 7.days).date as NSDate,
            DateInRegion(region: regionChina).date as NSDate)
        return request
    }
    
    static var request_expensesInThisMonth: NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: true)]
        request.predicate = NSPredicate(
            format: "spentAt_ > %@ and spentAt_ < %@",
            DateInRegion(region: regionChina).dateAt(.startOfMonth).date as NSDate,
            DateInRegion(region: regionChina).dateAt(.endOfMonth).date as NSDate)
        return request
    }
    
    static var request_expensesInThisWeek: NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: true)]
        request.predicate = NSPredicate(
            format: "spentAt_ > %@ and spentAt_ < %@",
            DateInRegion(region: regionChina).dateAt(.startOfWeek).date as NSDate,
            DateInRegion(region: regionChina).dateAt(.endOfWeek).date as NSDate)
        return request
    }
    
    static func request_expensesInMonth(_ month: DateInRegion) -> NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: true)]
        request.predicate = NSPredicate(
            format: "spentAt_ > %@ and spentAt_ < %@",
            month.dateAt(.startOfMonth).date as NSDate,
            month.dateAt(.endOfMonth).date as NSDate)
        return request
    }
    
    // MARK: - fetch data
    
    static func getAllExpenses(context: NSManagedObjectContext, story_only: Bool = false) -> [Expense] {
        let expenses = try? context.fetch(story_only ? request_allExpensesWithStory : request_allExpensesWithStory)
        return expenses ?? []
    }

    // MARK: - access
    
    // Expense
    //   - system: uuid createdAt updatedAt
    //   - properties: spentAt event amount
    //   - other: originalText?
    //   - relationship: generatedTags tags focus forWho story?
    // 注：列表不会是nil 判空即可

    // system
    
    var uuid: UUID {
        get {
            if uuid_ != nil {
                return uuid_!
            } else {
                printError("未获取到uuid")
                return UUID()
            }
        }
        set { uuid_ = newValue }
    }
    
    var createdAt: DateInRegion {
        get {
            if createdAt_ != nil {
                return createdAt_!.convertTo(region: regionChina)
            } else {
                printFatalError("未获取到createdAt_")
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
                printFatalError("未获取到updatedAt_")
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
                printFatalError("未获取到spentAt_")
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
                printFatalError("未获取到event")
                return ""
            }
        }
        set { event_ = newValue }
    }
    
    var amount: Float {
        get { return amount_ }
        set { amount_ = newValue }
    }
    
    // other
    
    var originalText: String? {
        get { originalText_ }
        set { event_ = newValue }
    }
    
    // relationship - single
    
    var story: Story? {
        get { story_ }
        set { story_ = newValue }
    }
    
    var focus: Focus? {
        get { focus_ }
        set { focus_ = newValue }
    }
    
    // relationship - multiple
    
    var tags: Set<Tag> {
        get { (tags_ as? Set<Tag>) ?? [] }
        set { tags_ = newValue as NSSet }
    }
    
    var forWho: Set<Someone> {
        get { (forWho_ as? Set<Someone>) ?? [] }
        set { forWho_ = newValue as NSSet }
    }
    
    var generatedTags: Set<Tag> {
        get { (generatedTags_ as? Set<Tag>) ?? [] }
        set { generatedTags_ = newValue as NSSet }
    }
    
    // MARK: - combined data
    
    var expenseInfo: ExpenseInfo {
        ExpenseInfo(originalText: originalText,
                    spentMoneyAt: spentAt,
                    event: event,
                    amount: amount,
                    generatedTags: generatedTags.map { $0.name },
                    tags: tags.map { $0.name },
                    focus: focus?.name,
                    forWho: forWho.map { $0.name },
                    story: ExpenseInfo.Story(rating: story?.rating, emoji: story?.emoji, text: story?.text))
    }
    
    // MARK: - operation
    
    static func create(expenseInfo: ExpenseInfo, context: NSManagedObjectContext) {
        let expense = Expense(context: context)
        
        expense.originalText = expenseInfo.originalText
        
        expense.spentAt = expenseInfo.spentMoneyAt
        expense.event = expenseInfo.event
        expense.amount = expenseInfo.amount
        
        if expenseInfo.story != nil {
            expense.story = Story.create(story: expenseInfo.story!, context: context)
        }
        
        expense.objectWillChange.send()
        try? context.save()
    }

    // MARK: - analysis

    // TODO: 这个函数是用来干嘛的？
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
    
    /// 获取某个月内的所有Expense，并按照天数分组
    ///
    /// 返回 一个字典：天数 - 当天的Expenses；该月最后一个有Expense的天数
    ///
    /// return: Day: nil 表示这个月没有Expense
    static func getExpensesDiviedByDaysInMonth(_ month: DateInRegion, context: NSManagedObjectContext) -> ([Day: [Expense]], Day?) {
        let expensesInMonth = try? context.fetch(Expense.request_expensesInMonth(month))
        
        var dayItems: [Day: [Expense]] = [
            .D1: [],
            .D2: [],
            .D3: [],
            .D4: [],
            .D5: [],
            .D6: [],
            .D7: [],
            .D8: [],
            .D9: [],
            .D10: [],
            .D11: [],
            .D12: [],
            .D13: [],
            .D14: [],
            .D15: [],
            .D16: [],
            .D17: [],
            .D18: [],
            .D19: [],
            .D20: [],
            .D21: [],
            .D22: [],
            .D23: [],
            .D24: [],
            .D25: [],
            .D26: [],
            .D27: [],
            .D28: [],
            .D29: [],
            .D30: [],
            .D31: [],
        ]
        if expensesInMonth != nil {
            for expense in expensesInMonth! {
                if let day = Day(rawValue: expense.spentAt.day) {
                    // 这里用叹号没有危险 因为Day全用的枚举
                    dayItems[day]!.append(expense)
                   
                    printLog("[\((#filePath as NSString).lastPathComponent) \(#function) line\(#line)] Appended \(expense.event)")
                } else {
                    printError("")
                }
            }
        } else {
            return (dayItems, nil)
        }
        
        // 中间变量 记录有item的天
        var daysWithExpenses: [Day] = []
        for (day, expenses) in dayItems {
            if expenses.count != 0 {
                daysWithExpenses.append(day)
            }
        }
        
        // 该月有Expense的最后一天
        let lastDatWithExpenses: Day? = daysWithExpenses.count == 0 ? nil : daysWithExpenses.max()

        return (dayItems, lastDatWithExpenses)
    }
}

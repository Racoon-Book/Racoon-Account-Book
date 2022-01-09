import CoreData
import Foundation
import XCLog

extension Tag {
    // MARK: - fetch requests

    // MARK: - access

    // Tag: name

    var name: String {
        get {
            if name_ != nil {
                return name_!
            } else {
                XCLog(.error, "未获取到name")
                return ""
            }
        }
        set { name_ = newValue }
    }

    var expenses: Set<Expense> {
        get { (expenses_ as? Set<Expense>) ?? [] }
        set { expenses_ = newValue as NSSet }
    }

    // 不会用到 不会用生成的标签去做什么事情
    var generatedExpenses: Set<Expense> {
        get { (generatedExpenses_ as? Set<Expense>) ?? [] }
        set { generatedExpenses_ = newValue as NSSet }
    }

    // MARK: - operation

    // 有Tag就获取 没有创建 因为Tag不需要重复
    @discardableResult
    static func tag(name: String, context: NSManagedObjectContext) -> Tag {
        let request = NSFetchRequest<Tag>(entityName: "Tag")
        request.predicate = NSPredicate(format: "name_ == %@", name)
        let result = (try? context.fetch(request)) ?? []

        if let tag = result.first {
            return tag
        } else {
            let newTag = Tag(context: context)

            newTag.name = name

            newTag.objectWillChange.send()

            try? context.save()

            return newTag
        }
    }

    // MARK: - analysis
}

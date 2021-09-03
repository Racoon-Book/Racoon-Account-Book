// Focus+.swift

import CoreData
import Foundation

extension Focus {
    // MARK: - fetch requests

    static var request_allFocus: NSFetchRequest<Focus> {
        let request = NSFetchRequest<Focus>(entityName: "Focus")
        request.sortDescriptors = [NSSortDescriptor(key: "name_", ascending: true)]
        return request
    }

    // MARK: - access

    // Focus: name expenses

    var name: String {
        get {
            if name_ != nil {
                return name_!
            } else {
                print(Log().fatalerror + "未获取到name")
                return ""
            }
        }
        set { name_ = newValue }
    }

    var expenses: Set<Expense> {
        get { (expenses_ as? Set<Expense>) ?? [] }
        set { expenses_ = newValue as NSSet }
    }

    // MARK: - operation

    // 有Focus就获取 没有创建 因为Focus不需要重复
    @discardableResult
    static func focus(name: String, context: NSManagedObjectContext) -> Focus {
        let request = NSFetchRequest<Focus>(entityName: "Focus")
        request.predicate = NSPredicate(format: "name_ == %@", name)
        let result = (try? context.fetch(request)) ?? []

        if let focus = result.first {
            return focus
        } else {
            let newFocus = Focus(context: context)

            newFocus.name = name

            newFocus.objectWillChange.send()

            try? context.save()

            return newFocus
        }
    }

    // MARK: - analysis

    // 获取总共的focus种数
    static func focusAmount(context: NSManagedObjectContext) -> Int {
        if let foci = try? context.fetch(Focus.request_allFocus) {
            return foci.count
        } else {
            return 0
        }
    }
}

// Someone+.swift

import CoreData
import Foundation
import XCLog

extension Someone {
    // MARK: - fetch requests

    static var request_allSomeone: NSFetchRequest<Someone> {
        let request = NSFetchRequest<Someone>(entityName: "Someone")
        request.sortDescriptors = [NSSortDescriptor(key: "name_", ascending: true)]
        return request
    }

    // MARK: - access

    // Someone: name expenses

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

    // MARK: - operation

    static func create(name: String, context: NSManagedObjectContext) {
        let newSomeone = Someone(context: context)

        newSomeone.name = name

        newSomeone.objectWillChange.send()

        try? context.save()
    }

    // 有Someone就获取 没有创建 因为Someone不需要重复
    @discardableResult
    static func someone(name: String, context: NSManagedObjectContext) -> Someone {
        let request = NSFetchRequest<Someone>(entityName: "Someone")
        request.predicate = NSPredicate(format: "name_ == %@", name)
        let result = (try? context.fetch(request)) ?? []

        if let focus = result.first {
            return focus
        } else {
            let newSomeone = Someone(context: context)

            newSomeone.name = name

            newSomeone.objectWillChange.send()

            try? context.save()

            return newSomeone
        }
    }

    // MARK: - analysis
}

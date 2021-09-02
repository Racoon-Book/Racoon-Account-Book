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

    var name: String {
        get { name_ ?? "没获取到name_" }
        set { name_ = newValue }
    }

    // MARK: - operation

    static func create(name: String, context: NSManagedObjectContext) {
        let newFocus = Focus(context: context)

        newFocus.name = name

        try? context.save()
    }

    // MARK: - analysis

    static func focusAmount(context: NSManagedObjectContext) -> Int {
        if let foci = try? context.fetch(Focus.request_allFocus) {
            return foci.count
        } else {
            return 0
        }
    }
}

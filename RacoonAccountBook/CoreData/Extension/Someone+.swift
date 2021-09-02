// Someone+.swift

import CoreData
import Foundation

extension Someone {
    // MARK: - fetch requests

    static var request_allFocus: NSFetchRequest<Someone> {
        let request = NSFetchRequest<Someone>(entityName: "Someone")
        request.sortDescriptors = [NSSortDescriptor(key: "name_", ascending: true)]
        return request
    }

    // MARK: - access

    // Focus: name

    var name: String {
        get {
            if name_ != nil {
                return name_!
            } else {
                print("未获取到name")
                return ""
            }
        }
        set { name_ = newValue }
    }

    // MARK: - operation

    static func create(name: String, context: NSManagedObjectContext) {
        let newSomeone = Someone(context: context)

        newSomeone.name = name

        newSomeone.objectWillChange.send()

        try? context.save()
    }

    // MARK: - analysis
}

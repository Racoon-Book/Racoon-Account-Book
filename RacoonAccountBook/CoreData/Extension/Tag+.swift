import CoreData
import Foundation

extension Tag {
    // MARK: - fetch requests

    // MARK: - access
    
    // Tag: name

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
    
    // 有tag就获取 没有创建
    func tag(name: String, context: NSManagedObjectContext) -> Tag {
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

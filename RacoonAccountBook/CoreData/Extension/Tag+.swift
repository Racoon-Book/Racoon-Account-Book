import CoreData
import Foundation

extension Tag {
    
    // MARK: Access
    
    // 有tag就获取 没有创建
    func tag(context: NSManagedObjectContext, _ tag_name: String) -> Tag {
        let request = NSFetchRequest<Tag>(entityName: "Tag")
        request.predicate = NSPredicate(format: "name == %@", tag_name)
        let result = (try? context.fetch(request)) ?? []
        
        if let tag = result.first {
            return tag
        } else {
            let tag = Tag(context: context)
            tag.name = tag_name
            
            tag.objectWillChange.send()
            try? context.save()
            
            return tag
        }
    }
}

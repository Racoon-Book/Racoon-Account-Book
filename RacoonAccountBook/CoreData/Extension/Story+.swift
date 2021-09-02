import CoreData
import Foundation

extension Story {
    // MARK: - fetch requests

    // MARK: - access
    
    var rating: Int? {
        get { Int(rating_) }
        set { rating_ = Int16(newValue ?? 3) } // 设定的时候才会进行判断 不是说默认存到数据库就为3
    }
    
    var emoji: String? {
        get { emoji_ }
        set { emoji_ = newValue }
    }
    
    var text: String? {
        get { text_ }
        set { text_ = newValue }
    }
    
    // MARK: - operation
    
    static func create(context: NSManagedObjectContext, story story_data: ExpenseInfo.Story) -> Story {
        let newStory = Story(context: context)
        
        if let rating = story_data.rating {
            newStory.rating = rating
        }
        if let emoji = story_data.emoji {
            newStory.emoji = emoji
        }
        if let text = story_data.text {
            newStory.text = text
        }
        
        newStory.objectWillChange.send()
        
        try? context.save()
        
        return newStory
    }

    // MARK: - analysis
}

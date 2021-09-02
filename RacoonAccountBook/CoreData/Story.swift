import CoreData

extension Story {
    
    // MARK: Access
    
    // MARK: Update
    
    static func create(context: NSManagedObjectContext, story story_data: ExpenseInfo.Story) -> Story {
        let story = Story(context: context)
        
        story.rating = story_data.rating!
        story.emoji = story_data.emoji
        story.text = story_data.text
        
        story.objectWillChange.send()
        try? context.save()
        
        return story
    }
    
    // MARK: Properties
    
    var rating: Int {
        get { Int(rating_) }
        set { rating_ = Int16(newValue) }
    }
}

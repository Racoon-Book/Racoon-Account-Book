import CoreData

extension Story {
    
    // MARK: Access
    
    // MARK: Update
    
    static func create(context: NSManagedObjectContext, story story_data: MetaItem.Story) -> Story {
        let story = Story(context: context)
        
        story.rating = Int16(story_data.rating!)
        story.emoji = story_data.emoji
        story.text = story_data.text
        
        story.objectWillChange.send()
        try? context.save()
        
        return story
    }
}

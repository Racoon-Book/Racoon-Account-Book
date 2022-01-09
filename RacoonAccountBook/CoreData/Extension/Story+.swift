import CoreData
import Foundation
import XCLog

extension Story {
    // MARK: - fetch requests

    // MARK: - access

    // Story:
    // properties: rating emoji? text?
    // ralations: expense

    var rating: Int {
        get { Int(rating_) }
        set { rating_ = Int16(newValue) } // 设定的时候才会进行判断 不是说默认存到数据库就为3
    }

    var emoji: String? {
        get { emoji_ }
        set { emoji_ = newValue }
    }

    var text: String? {
        get { text_ }
        set { text_ = newValue }
    }

    // relationship

    var expense: Expense {
        get {
            if expense_ != nil {
                return expense_!
            } else {
                XCLog(.error, "story 无法获取到对应的 expense")
                return Expense()
            }
        }
        set { expense_ = newValue }
    }

    // MARK: - operation

    static func create(story: ExpenseInfo.Story, context: NSManagedObjectContext) -> Story {
        let newStory = Story(context: context)

        if let rating = story.rating {
            newStory.rating = rating
        }
        if let emoji = story.emoji {
            newStory.emoji = emoji
        }
        if let text = story.text {
            newStory.text = text
        }

        newStory.objectWillChange.send()

        try? context.save()

        return newStory
    }

    // MARK: - analysis
}

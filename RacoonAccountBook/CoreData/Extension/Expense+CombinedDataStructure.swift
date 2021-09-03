// Expense+CombinedDataStructure.swift

import CoreData
import Foundation

extension Expense {
    // MARK: - CombinedDataStructure

    var expenseInfo: ExpenseInfo {
        get {
            ExpenseInfo(originalText: originalText,
                        spentAt: spentAt,
                        event: event,
                        amount: amount,
                        generatedTags: generatedTags.map { $0.name },
                        tags: tags.map { $0.name },
                        focus: focus?.name,
                        forWho: forWho.map { $0.name },
                        story: story == nil ? nil : ExpenseInfo.Story(rating: story?.rating, emoji: story?.emoji, text: story?.text))
        }

        set {
            // Expense

            //   - properties: spentAt event amount
            spentAt = newValue.spentAt
            event = newValue.event

            amount = newValue.amount

            //   - other: originalText?
            originalText = newValue.originalText

            //   - relationship: story? focus generatedTags tags forWho
            if newValue.story != nil {
                story = Story.create(story: newValue.story!, context: managedObjectContext!)
            } else {
                story = nil
            }

            if newValue.focus != nil {
                focus = Focus.focus(name: newValue.focus!, context: managedObjectContext!)
            }

            if newValue.generatedTags.count != 0 {
                for name in newValue.generatedTags {
                    // 添加关系
                    // 如果Tag有了就直接添加；没有就创建之后再添加
                    addToGeneratedTags_(Tag.tag(name: name, context: managedObjectContext!))
                }
            }

            if newValue.tags.count != 0 {
                for name in newValue.tags {
                    // 添加关系
                    addToTags_(Tag.tag(name: name, context: managedObjectContext!))
                }
            }

            if newValue.forWho.count != 0 {
                for name in newValue.forWho {
                    // 添加关系
                    addToForWho_(Someone.someone(name: name, context: managedObjectContext!))
                }
            }
        }
    }
}

// Expense+Attributes.swift

import CoreData
import Foundation
import SwiftDate

extension Expense {
    // MARK: - Attributes

    // Expense
    //   - system: uuid createdAt updatedAt
    //   - properties: spentAt event amount
    //   - other: originalText?
    //   - relationship: generatedTags tags focus forWho story?
    // 注：列表不会是nil 判空即可

    // system

    var uuid: UUID {
        get {
            if uuid_ != nil {
                return uuid_!
            } else {
                printFatalError("未获取到uuid")
                return UUID()
            }
        }
        set { uuid_ = newValue }
    }

    var createdAt: DateInRegion {
        get {
            if createdAt_ != nil {
                return createdAt_!.convertTo(region: regionChina)
            } else {
                printFatalError("未获取到createdAt_")
                return DateInRegion(region: regionChina)
            }
        }
        set { createdAt_ = newValue.date }
    }

    var updatedAt: DateInRegion {
        get {
            if updatedAt_ != nil {
                return updatedAt_!.convertTo(region: regionChina)
            } else {
                printFatalError("未获取到updatedAt_")
                return DateInRegion(region: regionChina)
            }
        }
        set { updatedAt_ = newValue.date }
    }

    // properties

    var spentAt: DateInRegion {
        get {
            if spentAt_ != nil {
                return spentAt_!.convertTo(region: regionChina)
            } else {
                printFatalError("未获取到spentAt_")
                return DateInRegion(region: regionChina)
            }
        }
        set { spentAt_ = newValue.date }
    }

    var event: String {
        get {
            if event_ != nil {
                return event_!
            } else {
                printFatalError("[\((#filePath as NSString).lastPathComponent) \(#function) line\(#line)] 未获取到event")
                return ""
            }
        }
        set { event_ = newValue }
    }

    var amount: Float {
        get { return amount_ }
        set { amount_ = newValue }
    }

    // other

    var originalText: String? {
        get { originalText_ }
        set { originalText_ = newValue }
    }

    // relationship - single

    var story: Story? {
        get { story_ }
        set { story_ = newValue }
    }

    var focus: Focus? {
        get { focus_ }
        set { focus_ = newValue }
    }

    // relationship - multiple

    var tags: Set<Tag> {
        get { (tags_ as? Set<Tag>) ?? [] }
        set { tags_ = newValue as NSSet }
    }

    var forWho: Set<Someone> {
        get { (forWho_ as? Set<Someone>) ?? [] }
        set { forWho_ = newValue as NSSet }
    }

    var generatedTags: Set<Tag> {
        get { (generatedTags_ as? Set<Tag>) ?? [] }
        set { generatedTags_ = newValue as NSSet }
    }
}

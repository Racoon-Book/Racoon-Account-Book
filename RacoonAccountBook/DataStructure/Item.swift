import Foundation
import SwiftDate

// [Item] - 基础数据结构加上软件管理用的其他数据为一个完整的Item
struct Item: Identifiable, Hashable {
    // [Identifiable]
    var id: Int

    // [生成Item时自动生成]
    let createdAt = DateInRegion(region: regionChina) // 创建时自动生成日期
    var updatedAt = DateInRegion(region: regionChina) // 创建时自动生成日期 只在创建时自动生成

    // [Core Data]
    var metadata: MetaItem

    // [Hashable]
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
    
    // [Hashable]
    // https://stackoverflow.com/a/56401466/14298786 虽然看不懂
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Item: CustomStringConvertible {
    var description: String {
        let createdAt: String = createdAt.toFormat("yyyy/M/d", locale: Locales.chineseChina)
        let updatedAt: String = updatedAt.toFormat("yyyy/M/d, H:mm:ss", locale: Locales.chineseChina)

        let result = "Item: {id:\(id), createdAt:\(createdAt), updatedAt:\(updatedAt)}" + " " + "\(metadata)"

        return result
    }
}

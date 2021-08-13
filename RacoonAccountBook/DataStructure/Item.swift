import Foundation
import SwiftDate

/// MetaItem加上软件管理所使用的其他数据
struct Item: Identifiable, Hashable {
    // Identifiable
    var id: Int

    // Hashable
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }

    // https://stackoverflow.com/a/56401466/14298786 虽然看不懂
    // Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // MARK: - 生成Item时自动生成

    /// 创建时自动生成日期
    let createdAt = DateInRegion(region: regionChina)
    /// 创建时自动生成日期 只在创建时自动生成
    var updatedAt = DateInRegion(region: regionChina)

    /// 一条账目的核心内容
    var metadata: MetaItem
}

// 将Item转换为字符串
extension Item: CustomStringConvertible {
    var description: String {
        let createdAt: String = self.createdAt.toFormat("yyyy/M/d", locale: Locales.chineseChina)
        let updatedAt: String = self.updatedAt.toFormat("yyyy/M/d, H:mm:ss", locale: Locales.chineseChina)

        let result = "Item: {id:\(id), createdAt:\(createdAt), updatedAt:\(updatedAt)}" + " " + "\(metadata)"

        return result
    }
}

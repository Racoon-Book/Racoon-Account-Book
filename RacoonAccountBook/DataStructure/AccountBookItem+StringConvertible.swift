// 将Struct转换为字符串，可以直接使用`\(Item)`进行打印

import Foundation
import SwiftDate

extension AccountBook.Item: CustomStringConvertible {
    var description: String {
        let result = "Item {id:\(id), createdAt:\(createdAt), updatedAt:\(updatedAt)}" + "\n" + "\(metadata)"

        return result
    }
}

extension AccountBook.MetaItem: CustomStringConvertible {
    var description: String {
        let event: String = event
        let amount: String = String(format: "%.1f", amount_float)
        let date: String = spentMoneyAt.toFormat("MM/dd, EEEE", locale: Locales.chineseChina)

        return "MetaItem {event: \(event), amount: \(amount), spentMoneyAt: \(date)}"
    }
}

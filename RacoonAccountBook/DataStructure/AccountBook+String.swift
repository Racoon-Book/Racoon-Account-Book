// 将Struct转换为字符串，可以直接使用`\(SpendingItem)`进行打印

import Foundation

extension AccountBook.SpendingItem: CustomStringConvertible {
    var description: String {
        "SpendingItem {id:\(id), originalText:\(originalText), category:\(category), amount:\(amount), createdAt:\(createdAt), updatedAt:\(updatedAt)}"
    }
}

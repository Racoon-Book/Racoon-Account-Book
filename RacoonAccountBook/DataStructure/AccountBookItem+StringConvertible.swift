// 将Struct转换为字符串，可以直接使用`\(Item)`进行打印

import Foundation

extension AccountBook.Item: CustomStringConvertible {
    var description: String {
        "Item {id:\(id), originalText:\(originalText), category:\(category), amount:\(amount), createdAt:\(createdAt), updatedAt:\(updatedAt)}"
    }
}

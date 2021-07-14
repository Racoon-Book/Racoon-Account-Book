import Foundation
import SwiftDate

extension AccountBook.Item: CustomStringConvertible {
    var description: String {
        let createdAt: String = createdAt.toFormat("yyyy/M/d", locale: Locales.chineseChina)
        let updatedAt: String = updatedAt.toFormat("yyyy/M/d, H:mm:ss", locale: Locales.chineseChina)

        let result = "Item: {id:\(id), createdAt:\(createdAt), updatedAt:\(updatedAt)}" + "\n" + "\(metadata)"

        return result
    }
}

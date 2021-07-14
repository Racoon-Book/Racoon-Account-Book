import Foundation
import SwiftDate

extension AccountBook.MetaItem: CustomStringConvertible {
    var description: String {
        let event: String = event
        let amount: String = String(format: "%.1f", amount_float)
        let date: String = spentMoneyAt.toFormat("yyyy/M/d", locale: Locales.chineseChina)

        return "MetaItem: {spentMoneyAt: \(date), event: \(event), amount: \(amount)}"
    }
}

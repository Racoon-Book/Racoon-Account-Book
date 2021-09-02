import Foundation
import SwiftDate

/// 一段时间的花销
struct Ex {
    /// 这段时间的所有花销条目
    var items: [Item] = []

    // MARK: - 由上面的基础条目统计得到

    /// 支出总数
    var exSum: Float {
        var sum: Float = 0
        for item in items {
            sum += item.metadata.amount_float
        }
        return sum
    }

    /// 支出的条数
    var exCounter: Int {
        return items.count
    }

    /// 最高支出的金额
    var exHighest: Float {
        var highest: Float = 0
        for item in items {
            if item.metadata.amount_float > highest {
                highest = item.metadata.amount_float
            }
        }
        return highest
    }
    
    // 有新的关于账本的统计可以在这里添加
}

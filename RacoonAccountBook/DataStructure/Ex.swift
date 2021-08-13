import Foundation
import SwiftDate

/// 某年的花销
struct YearlyEx {
    /// 年份
    var year: Int // FIXME: 改为App支持的年份

    /// 每月的支出 共12项
    var monthlyEx: [Month: Ex]

    /// 输入年份 创建该年按月管理的花销
    /// - Parameter year: 某年花销的年份
    init(year: Int) {
        self.year = year
        monthlyEx = [
            .Jan: Ex(),
            .Feb: Ex(),
            .Mar: Ex(),
            .Apr: Ex(),
            .May: Ex(),
            .Jun: Ex(),
            .Jul: Ex(),
            .Aug: Ex(),
            .Sept: Ex(),
            .Oct: Ex(),
            .Nov: Ex(),
            .Dec: Ex(),
        ]
    }
}

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
}

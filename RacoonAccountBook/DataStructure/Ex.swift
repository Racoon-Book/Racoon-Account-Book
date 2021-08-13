import Foundation
import SwiftDate

// [一年的花销]
struct YearlyEx {
    var year: Int // 年份
    var monthlyEx: [Month: PeriodicEx] // 每月的支出，共12项

    init(year: Int) {
        self.year = year
        monthlyEx = [
            .Jan: PeriodicEx(sign: DateInRegion(year: year, month: 1, day: 1, region: regionChina)),
            .Feb: PeriodicEx(sign: DateInRegion(year: year, month: 2, day: 1, region: regionChina)),
            .Mar: PeriodicEx(sign: DateInRegion(year: year, month: 3, day: 1, region: regionChina)),
            .Apr: PeriodicEx(sign: DateInRegion(year: year, month: 4, day: 1, region: regionChina)),
            .May: PeriodicEx(sign: DateInRegion(year: year, month: 5, day: 1, region: regionChina)),
            .Jun: PeriodicEx(sign: DateInRegion(year: year, month: 6, day: 1, region: regionChina)),
            .Jul: PeriodicEx(sign: DateInRegion(year: year, month: 7, day: 1, region: regionChina)),
            .Aug: PeriodicEx(sign: DateInRegion(year: year, month: 8, day: 1, region: regionChina)),
            .Sept: PeriodicEx(sign: DateInRegion(year: year, month: 9, day: 1, region: regionChina)),
            .Oct: PeriodicEx(sign: DateInRegion(year: year, month: 10, day: 1, region: regionChina)),
            .Nov: PeriodicEx(sign: DateInRegion(year: year, month: 11, day: 1, region: regionChina)),
            .Dec: PeriodicEx(sign: DateInRegion(year: year, month: 12, day: 1, region: regionChina)),
        ]
    }
}

/// [一段时间的花销] 最大单位：月
struct PeriodicEx {
    var sign: DateInRegion // 这段时间的标志（比如标志它是哪月/哪年/哪周）

    var items: [Item] = [] // 这段时间产生的所有条目

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

// [花销]
struct Ex {
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

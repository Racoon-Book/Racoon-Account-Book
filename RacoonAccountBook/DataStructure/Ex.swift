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

// [一段时间的花销] 最大单位：月
struct PeriodicEx {
    var sign: DateInRegion // 这段时间的标志（比如标志它是哪月/哪年/哪周）

    var items: [Item] = [] // 这段时间产生的所有条目

    // 由上面这些条目统计得到的：
    var exSum: Float = 0 // 支出总数 // 为了性能，这个值每次存取都进行计算，而不是每次都遍历求和
    var exCounter: Int = 0 // 支出的条数
}

// [花销]
struct Ex {
    var items: [Item] = []

    var exSum: Float = 0 // 支出总数 // 为了性能，这个值每次存取都进行计算，而不是每次都遍历求和
    var exCounter: Int = 0 // 支出的条数
}

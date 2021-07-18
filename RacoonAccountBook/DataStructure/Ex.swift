import Foundation
import SwiftDate

struct YearlyEx {
    var year: Int // 年份
    var monthlyEx: [Month: periodicEx] // 每月的支出，共12项

    init(year: Int) {
        self.year = year
        monthlyEx = [
            .Jan: periodicEx(sign: DateInRegion(year: year, month: 1, day: 1, region: regionChina)),
            .Feb: periodicEx(sign: DateInRegion(year: year, month: 2, day: 1, region: regionChina)),
            .Mar: periodicEx(sign: DateInRegion(year: year, month: 3, day: 1, region: regionChina)),
            .Apr: periodicEx(sign: DateInRegion(year: year, month: 4, day: 1, region: regionChina)),
            .May: periodicEx(sign: DateInRegion(year: year, month: 5, day: 1, region: regionChina)),
            .Jun: periodicEx(sign: DateInRegion(year: year, month: 6, day: 1, region: regionChina)),
            .Jul: periodicEx(sign: DateInRegion(year: year, month: 7, day: 1, region: regionChina)),
            .Aug: periodicEx(sign: DateInRegion(year: year, month: 8, day: 1, region: regionChina)),
            .Sept: periodicEx(sign: DateInRegion(year: year, month: 9, day: 1, region: regionChina)),
            .Oct: periodicEx(sign: DateInRegion(year: year, month: 10, day: 1, region: regionChina)),
            .Nov: periodicEx(sign: DateInRegion(year: year, month: 11, day: 1, region: regionChina)),
            .Dec: periodicEx(sign: DateInRegion(year: year, month: 12, day: 1, region: regionChina)),
        ]
    }
}

// 用来记录一段时间的支出 最大单位：月
struct periodicEx {
    var sign: DateInRegion // 这段时间的标志（比如标志它是哪月/哪年/哪周）

    var items: [Item] = [] // 这段时间产生的所有条目

    // 由上面这些条目统计得到的：
    var exSum: Float = 0 // 支出总数 // 为了性能，这个值每次存取都进行计算，而不是每次都遍历求和
    var exCounter: Int = 0 // 支出的条数
}

struct wholeEx {
    var items: [Item] = []

    var exSum: Float = 0 // 支出总数 // 为了性能，这个值每次存取都进行计算，而不是每次都遍历求和
    var exCounter: Int = 0 // 支出的条数
}

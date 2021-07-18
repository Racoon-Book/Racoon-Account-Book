import Foundation
import SwiftDate

struct YearlyInEx {
    var year: Int // 年份
    var monthlyInEx: [MyMonth: PeriodInEx] // 每月的支出，共12项

    init(year: Int) {
        self.year = year
        monthlyInEx =
            [
                .Jan: PeriodInEx(sign: DateInRegion(year: year, month: 1, day: 1, region: regionChina)),
                .Feb: PeriodInEx(sign: DateInRegion(year: year, month: 2, day: 1, region: regionChina)),
                .Mar: PeriodInEx(sign: DateInRegion(year: year, month: 3, day: 1, region: regionChina)),
                .Apr: PeriodInEx(sign: DateInRegion(year: year, month: 4, day: 1, region: regionChina)),
                .May: PeriodInEx(sign: DateInRegion(year: year, month: 5, day: 1, region: regionChina)),
                .Jun: PeriodInEx(sign: DateInRegion(year: year, month: 6, day: 1, region: regionChina)),
                .Jul: PeriodInEx(sign: DateInRegion(year: year, month: 7, day: 1, region: regionChina)),
                .Aug: PeriodInEx(sign: DateInRegion(year: year, month: 8, day: 1, region: regionChina)),
                .Sept: PeriodInEx(sign: DateInRegion(year: year, month: 9, day: 1, region: regionChina)),
                .Oct: PeriodInEx(sign: DateInRegion(year: year, month: 10, day: 1, region: regionChina)),
                .Nov: PeriodInEx(sign: DateInRegion(year: year, month: 11, day: 1, region: regionChina)),
                .Dec: PeriodInEx(sign: DateInRegion(year: year, month: 12, day: 1, region: regionChina)),
            ]
    }
}

// 用来记录一段时间的收支 最大单位：月
struct PeriodInEx {
    var sign: DateInRegion // 这段时间的标志（比如标志它是哪月/哪年/哪周）
    var items: [Item] = [] // 这段时间产生的所有条目

    // 由上面这些条目统计得到的：
    var expenditureSum: Float = 0 // 支出总数
    var expenditureAmount: Int = 0 // 支出的条数
}

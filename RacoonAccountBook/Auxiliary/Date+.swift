import Foundation
import SwiftDate

// 之后所有生成的`DataInRegion`都需要添加`region: regionChina`
let regionChina = Region(calendar: Calendars.gregorian, zone: Zones.asiaShanghai, locale: Locales.chineseChina)

enum Month: Int {
    case Jan = 1
    case Feb = 2
    case Mar = 3
    case Apr = 4
    case May = 5
    case Jun = 6
    case Jul = 7
    case Aug = 8
    case Sept = 9
    case Oct = 10
    case Nov = 11
    case Dec = 12
}

enum Day: Int {
    case D1 = 1
    case D2 = 2
    case D3 = 3
    case D4 = 4
    case D5 = 5
    case D6 = 6
    case D7 = 7
    case D8 = 8
    case D9 = 9
    case D10 = 10
    case D11 = 11
    case D12 = 12
    case D13 = 13
    case D14 = 14
    case D15 = 15
    case D16 = 16
    case D17 = 17
    case D18 = 18
    case D19 = 19
    case D20 = 20
    case D21 = 21
    case D22 = 22
    case D23 = 23
    case D24 = 24
    case D25 = 25
    case D26 = 26
    case D27 = 27
    case D28 = 28
    case D29 = 29
    case D30 = 30
    case D31 = 31
}

// sort
extension Day: Comparable {
    static func < (lhs: Day, rhs: Day) -> Bool { lhs.rawValue < rhs.rawValue }
}

// 只支持能看得到的年份
enum SupportedYear: Int {
    case Y2020 = 2020
    case Y2021 = 2021
    case Y2022 = 2022
    case Y2023 = 2023
    case Y2024 = 2024
}

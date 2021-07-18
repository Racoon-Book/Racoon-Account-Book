import Foundation
import SwiftDate

let regionChina = Region(calendar: Calendars.gregorian, zone: Zones.asiaShanghai, locale: Locales.chineseChina)

enum MyMonth: Int {
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

enum MyYear: Int {
    case Y2020 = 2020
    case Y2021 = 2021
    case Y2022 = 2022
    case Y2023 = 2023
    case Y2024 = 2024
}

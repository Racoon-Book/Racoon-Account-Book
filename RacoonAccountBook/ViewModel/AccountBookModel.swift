// ModelView -- Access Model & Deal with Intents

import Foundation
import SwiftDate

class AccountBookModel: ObservableObject {
    // MARK: - Create Model

    @Published private var model = AccountBookModel.newAccountBook() // init the model

    // Initialize Model (not able to directly initialize the model after equal)
    private static func newAccountBook() -> AccountBook {
        return AccountBook()
    }

    // MARK: - Access to Data of Model

    // get private property from Model

    var monthlyBook: [SupportedYear: YearlyEx] {
        model.monthlyBook
    }

    var wholeBook: Ex {
        model.wholeBook
    }

    // MARK: - Access to calculated Data

    func GetDayItemsInOneMonth(date: DateInRegion) -> ([Day: Ex], Day?) {
        let year: Int = date.year
        let month: Int = date.month

        let itemsInMonth = monthlyBook[SupportedYear(rawValue: year) ?? .Y2024]?
            .monthlyEx[Month(rawValue: month) ?? .Dec]?
            .items ?? []

        var dayItems: [Day: Ex] = [
            .D1: Ex(),
            .D2: Ex(),
            .D3: Ex(),
            .D4: Ex(),
            .D5: Ex(),
            .D6: Ex(),
            .D7: Ex(),
            .D8: Ex(),
            .D9: Ex(),
            .D10: Ex(),
            .D11: Ex(),
            .D12: Ex(),
            .D13: Ex(),
            .D14: Ex(),
            .D15: Ex(),
            .D16: Ex(),
            .D17: Ex(),
            .D18: Ex(),
            .D19: Ex(),
            .D20: Ex(),
            .D21: Ex(),
            .D22: Ex(),
            .D23: Ex(),
            .D24: Ex(),
            .D25: Ex(),
            .D26: Ex(),
            .D27: Ex(),
            .D28: Ex(),
            .D29: Ex(),
            .D30: Ex(),
            .D31: Ex(),
        ]

        for item in itemsInMonth {
            let day = Day(rawValue: item.metadata.spentMoneyAt.day) ?? .D1

            // 这里用叹号没有危险 因为Day全用的枚举
            dayItems[day]!.items.append(item)
            dayItems[day]!.exCounter = dayItems[day]?.exCounter ?? 0 + 1
            dayItems[day]!.exSum = dayItems[day]?.exSum ?? 0.0 + item.metadata.amount_float
        }

        // 如果没有 这里就要是可选类型了
        var daysWithItems: [Day] = []

        for (key, value) in dayItems {
            if value.items.count != 0 {
                daysWithItems.append(key)
            }
        }

        print("::::::  \(daysWithItems)")

        return (dayItems, daysWithItems.max())
    }

    // MARK: - Deal with Intents from View

    func createItem(metadata: MetaItem) {
        _ = model.createItem(metadata: metadata)
    }
}

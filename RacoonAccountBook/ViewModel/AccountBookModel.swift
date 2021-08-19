// ModelView -- Access Model & Deal with Intents

import Foundation
import SwiftDate

class AccountBookModel: ObservableObject {
    // MARK: - Create Model

    @Published private var model = AccountBookModel.newAccountBook() // init the model

    // Initialize Model (not able to directly initialize the model after equal)
    // TODO: 这里要确保数据在App开启和关闭时顺利更新
    private static func newAccountBook() -> AccountBook {
        return AccountBook()
    }

    // MARK: - Access to Data of Model

    /// 所有花销
    var wholeEx: Ex {
        model.wholeEx
    }

    // MARK: - 对数据进行添加修改操作

    /// 通过MetaItem给AccountBook中插入Item
    func createItem(metadata: MetaItem) {
        _ = model.createItem(metadata: metadata)
    }

    func updateItem(id: Int, metadata: MetaItem) -> Bool {
        let successfullyUpdate: Bool = model.updateItem(id: id, metadata: metadata)
        if successfullyUpdate {
            self.objectWillChange.send()
        }
        return successfullyUpdate
    }

    // MARK: - 返回某个时间段的Ex

    /// 返回当月的Ex
    func getExOfCurrentMonth() -> Ex {
        let today = DateInRegion(region: regionChina)

        let itemsInCurrentMonth: [Item] = wholeEx.items.filter {
            $0.metadata.spentMoneyAt.compare(.isSameMonth(today))
        }
        return Ex(items: itemsInCurrentMonth)
    }

    /// 返回某个月的Ex
    func getExOfMonth(year: Int, month: Int) -> Ex {
        let targetMonth = DateInRegion(year: year, month: month, day: 1)

        let itemsInMonth: [Item] = wholeEx.items.filter {
            $0.metadata.spentMoneyAt.compare(.isSameMonth(targetMonth))
        }
        return Ex(items: itemsInMonth)
    }

    /// 返回某个月的Ex
    func getExOfMonth(_ targetMonth: DateInRegion) -> Ex {
        let itemsInMonth: [Item] = wholeEx.items.filter {
            $0.metadata.spentMoneyAt.compare(.isSameMonth(targetMonth))
        }
        return Ex(items: itemsInMonth)
    }

    /// 返回这周的Ex
    func getExOfCurrentWeek() -> Ex {
        let today = DateInRegion(region: regionChina)

        let itemsInCurrentWeek: [Item] = wholeEx.items.filter {
            $0.metadata.spentMoneyAt.compare(.isSameWeek(today))
        }
        return Ex(items: itemsInCurrentWeek)
    }

    // MARK: - 返回符合要求的Ex

    /// 返回有故事的Ex
//    func getExWithStory() -> Ex {
//        let itemsWithStory: [Item] = wholeEx.items.filter {
//            $0.metadata.story != nil
//        }
//
//        return Ex(items: itemsWithStory)
//    }

    var exWithStory: Ex {
        let itemsWithStory: [Item] = wholeEx.items.filter {
            $0.metadata.story != nil
        }

        return Ex(items: itemsWithStory)
    }

    // FIXME: 改成Ex
    func GetBookOfThisMonthOfTag(tag: String) -> Ex {
        var book = getExOfCurrentMonth()

        // 筛选包含tag的记录
        // FIXME: 对关注标签的理解似乎不对
        book.items = book.items.filter { $0.metadata.tags.contains(tag) || $0.metadata.focus == tag }

        return book
    }

    // MARK: - 计算一些属性

    // MARK: - 特殊函数

    /// 返回某个月的花销 和 该月最后有花销的天数
    /// - Parameter date: 某个月
    /// - Returns: `这个月份按天分组后的字典`和`最后有item的天数`
    func getExDiviedByDaysInMonth(_ month: DateInRegion) -> ([Day: Ex], Day?) {
        let itemsInMonth = getExOfCurrentMonth().items

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
            if let day = Day(rawValue: item.metadata.spentMoneyAt.day) {
                // 这里用叹号没有危险 因为Day全用的枚举
                dayItems[day]!.items.append(item)
            } else {
                printLog("Error in model.GetDayItemsInOneMonth()")
            }
        }

        // 中间变量 记录有item的天
        var daysWithItems: [Day] = []
        for (key, value) in dayItems {
            if value.items.count != 0 {
                daysWithItems.append(key)
            }
        }

        return (dayItems, daysWithItems.max())
    }
}

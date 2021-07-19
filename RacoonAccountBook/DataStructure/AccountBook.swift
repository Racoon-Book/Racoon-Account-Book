// Fundamental Data Structure

import Foundation
import SwiftDate

// [一个记账本，里面存储着App所需的全部信息]
struct AccountBook {
    // MARK: - Main Data & init

    // 存储所有的条目
    var wholeBook = Ex() // 这里sign随便填一个就可以了
    // 按照月来存储所有条目 方便进行统计
    var monthlyBook: [SupportedYear: YearlyEx] = [ // TODO：这个是用来取代items的
        .Y2020: YearlyEx(year: 2020),
        .Y2021: YearlyEx(year: 2021),
        .Y2022: YearlyEx(year: 2022),
        .Y2023: YearlyEx(year: 2023),
        .Y2024: YearlyEx(year: 2024),
    ] // TODO: 这里先支持个五年

    // MARK: - Logic

    // [初始化]
    init() {
        // FIXME: 这里之后初始化就变成从数据库读数据了！
        // FIXME: 这里插入的是测试数据
        for metadata in testMetaItems {
            let item = createItem(metadata: metadata)
            printLog("[AccountBook.init()] [Add testdata] " + "\(item)")
        }
        // END: 插入的是测试数据
    }

    // [使用MetaItem插入]
    mutating func createItem(metadata: MetaItem) -> Item {
        // 由MetaItem创建Item
        let item = Item(id: wholeBook.exCounter, metadata: metadata) // FIXME: 这里id只用wholeBook的 不清楚将来会不会发生什么问题

        // 其他辅助变量
        let year: Int = item.metadata.spentMoneyAt.year
        let month: Int = item.metadata.spentMoneyAt.month

        // 添加item
        // [monthlyBook]
        // FIXME: 如果没有对应的年份和月份，则添加到2024年1月 —— 但其实应该不添加然后报错 但这是UI的事情 相当于双重验证
        // 添加
        monthlyBook[SupportedYear(rawValue: year) ?? .Y2024]?
            .monthlyEx[Month(rawValue: month) ?? .Dec]?
            .items.append(item)
        // 计数
        let monthlyAmount = monthlyBook[SupportedYear(rawValue: year) ?? .Y2024]?
            .monthlyEx[Month(rawValue: month) ?? .Dec]?
            .exCounter ?? 0
        monthlyBook[SupportedYear(rawValue: year) ?? .Y2024]?
            .monthlyEx[Month(rawValue: month) ?? .Dec]?
            .exCounter = monthlyAmount + 1
        // 计算总额
        let monthlySum = monthlyBook[SupportedYear(rawValue: year) ?? .Y2024]?
            .monthlyEx[Month(rawValue: month) ?? .Dec]?
            .exSum ?? 0
        monthlyBook[SupportedYear(rawValue: year) ?? .Y2024]?
            .monthlyEx[Month(rawValue: month) ?? .Dec]?
            .exSum = monthlySum + metadata.amount_float

        // [wholeBook]
        // 添加
        wholeBook.items.append(item)
        // 计数
        wholeBook.exCounter = wholeBook.exCounter + 1
        // 计算总额
        wholeBook.exSum = wholeBook.exSum + metadata.amount_float

        // Log
        printLog("[AccountBook.createItem()] " + "id: \(item.id)" + "\n" + "\(item.metadata)")

        return item
    }

    // MARK: - Basic Data Structure

    // View in DataStructure Folder
}

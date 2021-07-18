// Fundamental Data Structure

import Foundation
import SwiftDate

// [一个记账本，里面存储着App所需的全部信息]
struct AccountBook {
    // MARK: - Main Data & init

    // [Basic]
    var items: [Item] = [] // 记账本中的所有条目用一个列表表示
    var itemsAmount: Int = 0 // 账本中总共有多少条账目 这个是真实的数量

    // [To Calculate]
    var expenditureSumSinceUseApp: Float = 0 // 为了性能，这个值每次都进行存取，而不是每次打开App都计算

    var book: [MyYear: YearlyInEx] = [ // TODO：这个是用来取代items的
        .Y2020: YearlyInEx(year: 2020),
        .Y2021: YearlyInEx(year: 2021),
        .Y2022: YearlyInEx(year: 2022),
        .Y2023: YearlyInEx(year: 2023),
        .Y2024: YearlyInEx(year: 2024),
    ] // TODO: 这里先支持个五年

    // MARK: - Logic

    // [初始化]
    init() {
        // FIXME: 这里之后初始化就变成从数据库读数据了！
        items = []
        itemsAmount = 0

        // FIXME: 这里插入的是测试数据
        for metadata in testMetaItems {
            let item = createItem(metadata: metadata)
            print("[AccountBook.init()] [Add testdata] " + "\(item)")
        }
        // END: 插入的是测试数据
    }

    // [使用MetaItem插入]
    mutating func createItem(metadata: MetaItem) -> Item {
        // 由MetaItem创建Item
        let item = Item(id: itemsAmount, metadata: metadata)

        let year: Int = item.metadata.spentMoneyAt.year
        let month: Int = item.metadata.spentMoneyAt.month

        // TODO: 添加这一条item
        // 尝试新的架构
        // FIXME: 如果没有对应的年份和月份，则添加到2024年1月
        book[MyYear(rawValue: year) ?? .Y2024]?
            .monthlyInEx[MyMonth(rawValue: month) ?? .Jan]?
            .items.append(item)
        // END: 尝试新的架构
        items.append(item) // 创建Item的同时算作第一次更新
        print("[AccountBook.createItem()] " + "id: \(item.id)" + "\n" + "\(item.metadata)")
        // 由于添加了Item所以数量加1
        itemsAmount = itemsAmount + 1

        return item
    }

    // MARK: - Basic Data Structure
    // View in DataStructure Folder
}

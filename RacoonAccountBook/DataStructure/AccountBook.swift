// Fundamental Data Structure

import Foundation
import SwiftDate

// [一个记账本，里面存储着App所需的全部信息]
struct AccountBook {
    // MARK: - Main Data & init

    var items: [Item] = [] // 记账本中的所有条目用一个列表表示
    var itemsAmount: Int = 0 // 账本中总共有多少条账目 这个是真实的数量

    // MARK: - Logic

    // [初始化]
    init() {
        items = []
        itemsAmount = 0

        // FIXME: 这里插入的是测试数据
        for metadata in testMetaItems {
            let item = createItem(metadata: metadata)
            print("插入了一条测试数据 Item: \(item)")
        }
        // END: 插入的是测试数据
    }

    // [使用MetaItem插入]
    mutating func createItem(metadata: AccountBook.MetaItem) -> AccountBook.Item {
        // 由MetaItem创建Item
        let item = Item(id: itemsAmount, metadata: metadata)

        // 添加这一条item
        items.append(item) // 创建Item的同时算作第一次更新
        print("用户插入了一条Item id为\(itemsAmount)\n内容为\(item.metadata)")
        // 由于添加了Item所以数量加1
        itemsAmount = itemsAmount + 1

        return item
    }

    // MARK: - Basic Data Structure

    // [Item] - 基础数据结构加上软件管理用的其他数据为一个完整的Item
    struct Item: Identifiable {
        // [Identifiable]
        var id: Int

        // [生成Item时自动生成]
        var createdAt = DateInRegion(region: regionChina) // 创建时自动生成日期 // TODO 让这个值生成之后无法更改
        var updatedAt = DateInRegion(region: regionChina) // 创建时自动生成日期 只在创建时自动生成

        var metadata: MetaItem
    }

    // [MetaItem] - 记账本的基础数据结构是一个元条目 用户所需要输入和生成的是这些数据
    struct MetaItem {
        // 语音转文字的结果 or 用户键盘输入的一段话
        var originalText: String

        // 可输入可自动生成
        var category: String // 判断字符串中有没有关键词 -> 数据关联
        // var motive: String // 大部分写死 自动关联category
        // var forWho: String //

        // 花销数额
        var amount_float: Float
        // 从originalText提取出来的文字 or 用户直接在输入框中输入的汉字；最终会转换为`amount_float`
        var amount_string: String
    }
}

// --------------------------------------------------------------
// [测试数据]
let testMetaItem_1 = AccountBook.MetaItem(originalText: "买水果花了二十", category: "生活", amount_float: 20, amount_string: "二十")
let testMetaItem_2 = AccountBook.MetaItem(originalText: "花二十二块五买了课本", category: "学习", amount_float: 22.5, amount_string: "二十二块五")
let testMetaItem_3 = AccountBook.MetaItem(originalText: "和朋友一起出去吃饭花了一百二", category: "社交", amount_float: 120, amount_string: "一百二")

let testMetaItems: [AccountBook.MetaItem] = [testMetaItem_1, testMetaItem_2, testMetaItem_3]

// 备注：
// id、date 应该是由struct来管的；这里应该新建一个更小的结构体
// 所有数数的从0开始！

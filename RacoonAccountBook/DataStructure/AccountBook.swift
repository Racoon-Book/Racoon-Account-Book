// Fundamental Data Structure

import Foundation

/// [一个记账本，里面存储着App所需的全部信息]
struct AccountBook {
    // MARK: - Main Data & init

    var items: [Item] = [] // 记账本中的所有条目用一个列表表示
    var itemsAmount: Int = 0 // 账本中总共有多少条账目

    // MARK: - Logic

    init() {
        items = []
        itemsAmount = 0

        // FIXME: 这里插入的是测试数据
        for item in testItems {
            print("插入了一条测试数据 \(item)")
            createItem(item: item)
        }
        // END: 插入的是测试数据
    }

    // 一个元素一个元素插入
    mutating func createItem(
        originalText: String,
        category: String,
        amount: Float)
    {
        items.append(Item(id: itemsAmount, originalText: originalText, category: category, amount: amount, createdAt: Date(), updatedAt: Date())) // 创建Item的同时算作第一次更新
        itemsAmount = itemsAmount + 1
        print("用户插入了一条Item id为\(itemsAmount)")
    }

    // 一次插入一个item
    mutating func createItem(item: AccountBook.Item) {
        items.append(item) // 创建Item的同时算作第一次更新
        itemsAmount = itemsAmount + 1
        print("用户插入了一条Item id为\(itemsAmount)\n内容为\(item)")
    }

    // MARK: - Basic Data Structure

    /// [Basic Data Structure] 记账本的基础数据结构是一个花销条目 - Item
    struct Item: Identifiable {
        /// [Identifiable]
        var id: Int

        /// [用户输入]
        var originalText: String // 需要用户来输入——语音转为文字或直接写入文字或直接写入备注（说明）

        /// [可输入可自动生成]
        var category: String // 判断字符串中有没有关键词 -> 数据关联
        // var motive: String // 大部分写死 自动关联category
        // var forWho: String //

        var amount: Float // 正则表达式，模型训练/机器学习，现成的module

        /// [生成Item时自动生成]
        var createdAt = Date() // 创建时自动生成日期
        var updatedAt = Date() // 创建时自动生成日期 只在创建时自动生成
    }
}

let testItem_1 = AccountBook.Item(id: 0, originalText: "买水果花了20", category: "生活", amount: 20, createdAt: Date(), updatedAt: Date())
let testItem_2 = AccountBook.Item(id: 1, originalText: "花二十二块五买了课本", category: "学习", amount: 22.5, createdAt: Date(), updatedAt: Date())

let testItems: [AccountBook.Item] = [testItem_1, testItem_2]

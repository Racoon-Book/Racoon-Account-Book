// Fundamental Data Structure

import Foundation

/// [一个记账本，里面存储着App所需的全部信息]
struct AccountBook {
    // MARK: - Main Data & init

    var bookItems: [SpendingItem] = [] // 记账本中的所有条目用一个列表表示

    var bookItemsNumber: Int = 0 // 账本中总共有多少条账目

    // MARK: - Logic

    init() {
        bookItems = []
        bookItemsNumber = 0

        // FIXME: 这里插入的是测试数据
        bookItems.append(SpendingItem(id: bookItemsNumber, originalText: "今天买水果花了20", category: "生活", amount: 20, createdAt: Date(), updatedAt: Date()))
        bookItemsNumber = bookItemsNumber + 1
        bookItems.append(SpendingItem(id: bookItemsNumber, originalText: "早上买了一本22元的书", category: "学习", amount: 22, createdAt: Date(), updatedAt: Date()))
        bookItemsNumber = bookItemsNumber + 1

        for item in bookItems {
            print("插入了一条测试数据 \(item)")
        }
    }

//    mutating func reset()
    mutating func createItem(originalText: String, category: String, amount: Float) {
        bookItems.append(SpendingItem(id: bookItemsNumber, originalText: originalText, category: category, amount: amount, createdAt: Date(), updatedAt: Date())) // 创建Item的同时算作第一次更新
        bookItemsNumber = bookItemsNumber + 1
        print("用户插入了一条Item id为\(bookItemsNumber)")
    }

    // MARK: - Basic Data Structure

    /// [Basic Data Structure] 记账本的基础数据结构是一个花销条目(Item)
    struct SpendingItem: Identifiable {
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
        var createdAt: Date
        var updatedAt: Date
    }
}

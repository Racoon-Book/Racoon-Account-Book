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
        // 用户在记账时语音输入转换得到或敲键盘的一句话 简单记录此次花销（至少包含花销的内容和金额）
        // 不保留原始语音 用户在机器生成后修改错别字 不在列表中显示 只做录入用
        var originalText: String? = nil

        // 消费发生的日期 (记昨天的账，日期为昨天）
        // 这里只存日期，排序时相同的日期用创建时间二次排序
        var spentMoneyAt: DateInRegion

        // 由originalText去掉钱数、日期自动生成
        var event: String

        // 金额 从originalText里面提取
        // 系统记录最多两位小数 但显示时四舍五入保留为一位 输入时弹出数字键盘
        var amount_float: Float

        // App自动识别originalText得到的关键词
        // 多为名词 添加用户自定义的词以提高准确度
        var tag_auto_generated: [String]? = nil

        // 用户编辑后的tag_auto_generated + 用户自己添加的
        // 后续可用来生成词云 产生新motive
        // 花销中的要素(elements) 包括但不限于 具体事件(时间(特殊纪念日)) 地点 人物 心情
        // 用户第一时间想到的，相关的要素，随意添加，越多越好；用户自己灵活使用
        var tag: [String]? = nil

        // 支出的目的 for what
        // 可以通过精选tag得到 多次出现的tag可以称为focus
        // 为用户所关注的花销的点 不关心这笔花销就不设置focus
        var focus: String? = nil

        // 为谁产生的花销
        // 一般开销都是自己的 如果不是为了自己的开销 用户选择更改
        // TODO: ps. 如果是丢失的欠款，好像也不是为了自己花的吧？
        var forWho: [String] = ["Me"]

        var story: Story? = nil

        struct Story {
            // 用户对这笔支出的评价 默认无评价 表示该笔支出没什么意义
            // 五星表示非常值得纪念 一星表示非常不值得
            // 如果想添加故事 那么这一项从nil变为有值 默认值为3 用户调整该值后添加story
            var rating: Int? = nil

            // 用户想的话 可以添加一个emoji
            var emoji: String? = nil

            // 用户在添加花销或回顾时找感兴趣的花销添加与这笔钱相关的故事
            var text: String? = nil
        }
    }
}

// Fundamental Data Structure

import Foundation
import SwiftDate

/// 一个账本的全部信息
struct AccountBook {
    // MARK: - 核心数据

    /// 存储所有条目的账本
    var wholeBook = Ex()

    // 记录用户添加的所有focus
    // TODO: 之后需要改成可以修改的，用户在设置中进行添加和删除 也就是说不能再是static了
    static let defaultFocusList: [String] = ["学习", "生活"] // TODO: 添加默认的关注列表
    #if DEV
        static var focusList: [String] = ["电子设备", "软件服务", "聚餐", "游戏", "宿舍"]
    #else
        static var focusList: [String] = AccountBook.defaultFocusList
    #endif

    // MARK: - Logic

    // [初始化]
    init() {
        // FIXME: 这里之后初始化就变成从数据库读数据了！
        #if DEV
            // 插入测试数据
            for metadata in testMetaItems {
                let item = createItem(metadata: metadata)
                printLog("[AccountBook.init()] [Add testdata] " + "\(item)")
            }
        #else
            // TODO: 从本地数据库读取数据放入Model
            print("AccountBook.init()")
        #endif
    }

    // [使用MetaItem插入]
    mutating func createItem(metadata: MetaItem) -> Item {
        // 由MetaItem创建Item
        let item = Item(id: wholeBook.exCounter, metadata: metadata) // FIXME: 这里id只用wholeBook的 不清楚将来会不会发生什么问题

        // 添加item到wholeBook
        wholeBook.items.append(item)

        // [Log]
        printLog("[AccountBook.createItem()] " + "id: \(item.id)" + "\n" + "\(item.metadata)")

        return item
    }

    // MARK: - Basic Data Structure

    // View in `DataStructure` Folder
}

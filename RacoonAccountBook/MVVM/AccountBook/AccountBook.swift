// Fundamental Data Structure

import Foundation
import SwiftDate

/// 一个账本的全部信息
struct AccountBook {
    // MARK: - 核心数据

    /// 所有的条目
    var wholeEx = Ex()

    /// 用于生成新账目的id
    ///
    /// 每次添加一个条目这个就加加、不减
    private var idCount: Int = 0

    // 记录用户添加的所有focus
    // TODO: 之后需要改成可以修改的，用户在设置中进行添加和删除 也就是说不能再是static了
    static let defaultFocusList: [String] = ["学习", "生活"] // TODO: 添加默认的关注列表
    #if DEV
        static var focusList: [String] = ["电子设备", "软件服务", "聚餐", "游戏", "宿舍"]
    #else
        static var focusList: [String] = AccountBook.defaultFocusList
    #endif

    // MARK: - init

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

    // MARK: - 一些简单的操作数据的函数

    /// 使用MetaItem插入数据
    mutating func createItem(metadata: MetaItem) -> Item {
        // 由MetaItem创建Item
        let item = Item(id: idCount, metadata: metadata)

        // 添加item到wholeBook
        wholeEx.items.append(item)

        idCount += 1

        // Log
        printLog("[AccountBook.createItem()] " + "id: \(item.id)" + "\n" + "\(item.metadata)")

        return item
    }

    mutating func updateItem(id: Int, metadata: MetaItem) -> Bool {
        if let indexToUpdate = wholeEx.items.firstIndex(where: {
            $0.id == id
        }) {
            wholeEx.items[indexToUpdate].updatedAt = DateInRegion(region: regionChina)
            wholeEx.items[indexToUpdate].metadata = metadata
            // Log
            printLog("[AccountBook.updateItem()] " + "id: \(id)" + "\n" + "\(wholeEx.items[indexToUpdate].metadata)")
            return true
        } else {
            return false
        }
    }
}
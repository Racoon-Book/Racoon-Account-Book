// WeChatBillInfo.swift

import Foundation
import SwiftDate

struct WeChatBillInfo: CustomStringConvertible, Identifiable, Hashable {
    // MARK: id

    var id = UUID()

    // MARK: Data Properties

    /// 支出摘要
    var name: String
    /// 支出用负数表示 收入用正数表示
    var amount: Float
    /// 支出日期和时间
    var spentAtDate: Date

    // MARK: Temp Properties

    /// 是不是和已经导入的条目有重复
    var isDuplicated: Bool = false

    /// 是否被用户选中打算导入
    var isSelected: Bool = true

    var description: String {
        "\(name) \(amount) \(spentAtDate)" // 改成Display
    }
}

extension RandomAccessCollection where Element == WeChatBillInfo {
    func sum() -> Float {
        reduce(0.0) { $0 + $1.amount }
    }
}

extension WeChatBillInfo {
    func toExpenseInfo() -> ExpenseInfo {
        ExpenseInfo(spentAtDate: spentAtDate, event: name, amount: amount)
    }
}

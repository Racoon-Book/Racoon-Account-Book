// WeChatBillInfo.swift

import Foundation
import SwiftDate

struct WeChatBillInfo: CustomStringConvertible {
    /// 支出摘要
    var name: String
    /// 支出用负数表示 收入用正数表示
    var amount: Float
    /// 支出日期和时间
    var spentAt: DateInRegion

    /// 是不是和已经导入的条目有重复
    var isDuplicated: Bool

    var description: String {
        "\(name) \(amount) \(spentAt)" // 改成Display
    }
}

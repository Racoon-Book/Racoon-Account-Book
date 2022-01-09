import Foundation
import SwiftDate

// 提取originalText中的spentMoneyAt
// 如果无法提取则返回nil
func OriginalText2SpentMoneyAt(from originalText: String) -> Date? {
    if originalText == "" {
        return nil
    }

    if originalText.contains("今天") {
        return Date()
    } else if originalText.contains("昨天") {
        return Date().dateAt(.yesterday)
    } else if originalText.contains("前天") || originalText.contains("两天前") {
        return Date() - 2.days
    } else if originalText.contains("上周") || originalText.contains("上周末") {
        return Date().dateAt(.startOfWeek) - 1.days
    } else if originalText.contains("上个月") || originalText.contains("上月") {
        return Date().dateAt(.startOfMonth) - 1.days
    }

    return nil
}

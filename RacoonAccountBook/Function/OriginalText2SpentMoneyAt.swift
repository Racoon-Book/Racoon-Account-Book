import Foundation
import SwiftDate

// 提取originalText中的spentMoneyAt
// 如果无法提取则返回nil
func OriginalText2SpentMoneyAt(from originalText: String) -> DateInRegion? {
    if originalText == "" {
        return nil
    }

    if originalText.contains("今天") {
        // 今天的话要返回当前的时间
        return DateInRegion(region: regionChina)
    } else if originalText.contains("昨天") {
        // 昨天的话就是昨晚的 23:59:59 这里时间实际上并不本质，但需要有，所以就写靠后的时间
        return DateInRegion(region: regionChina).dateAt(.yesterday).dateAt(.endOfDay)
    } else if originalText.contains("明天") {
        return DateInRegion(region: regionChina).dateAt(.tomorrow).dateAt(.endOfDay)
    } else if originalText.contains("上周") || originalText.contains("上周末") {
        // FIXME: 这里`.prevWeek`是以周日开始的，可能有方法可以设置每一周的开始时间，但这里再往后延？主页的ItemView的日期显示也是这个问题
        return DateInRegion(region: regionChina).dateAt(.prevWeek).dateAt(.tomorrow).dateAt(.endOfDay)
    } else if originalText.contains("上个月") || originalText.contains("上月") {
        return DateInRegion(region: regionChina).dateAt(.prevMonth).dateAt(.endOfDay)
    }

    return nil
}

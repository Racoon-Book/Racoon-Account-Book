import Foundation
import SwiftDate

func DisplayDate(_ date: Date) -> String {
    let isYesterday: Bool = date.compare(.isYesterday)
    let isToday: Bool = date.compare(.isToday)
    let isTomorrow: Bool = date.compare(.isTomorrow)

    return
        // `今天` `昨天` `明天`各自显示
        isToday ? date.toFormat("今天", locale: Locales.chineseChina) :
        isYesterday ? date.toFormat("昨天", locale: Locales.chineseChina) :
        isTomorrow ? date.toFormat("明天", locale: Locales.chineseChina) :
        // 是`这一周`和`上一周`显示星期
        date.compare(.isThisWeek) || date.compare(.isLastWeek) ? date.toFormat("M月d日 EEEE", locale: Locales.chineseChina) :
        // 如果不符合上述条件 不过是今年 则不显示年份
        date.compare(.isThisYear) ? date.toFormat("M月d日", locale: Locales.chineseChina) :
        // 其他的就说明是去年及以前 需要加上年份
        date.toFormat("yyyy年M月d日", locale: Locales.chineseChina)
}

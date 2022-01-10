import Foundation

// 传入一个含有金额的字符串 提取其中的金额 以Float的形式返回
// 返回nil说明无法提取到金额
func OriginalText2Amount(from originalText: String) -> Float? {
    if originalText == "" {
        return nil
    }
    if let amount_float: Float = GetFloatAmount(from: originalText) {
        // 可以直接提取数字
        return amount_float
    } else {
        // 提取不到就先提取中文的金额表达 然后转成Float返回
        if let ChineseAmount: String = GetChineseAmount(from: originalText),
           let amount_float: Float = ChineseAmount2Float(from: ChineseAmount)
        {
            return amount_float
        }
    }
    return nil
}

// 提取originalText中的数字
// eg. 去校医院看病花了22.15 -> 22.15
func GetFloatAmount(from originalText: String) -> Float? {
    var i: Int = 0
    var result: String = ""

    while i < originalText.count {
        var ch: Character = originalText[i]

        while i < originalText.count,
              NumList.contains(ch) ||
              NumMoneyUnitList.contains(ch)
        {
            result.append(ch)
            i = i + 1
            if i < originalText.count {
                ch = originalText[i]
            }
        }
        if i < originalText.count {
            i = i + 1
        }
        if result.count != 0 {
            return Float(result)
        } else {
            result = ""
        }
    }
    return nil
}

// 提取出originalText里面的数字
// 提取不到返回nil
// eg. 买书花了一百零五 -> 一百零五
func GetChineseAmount(from originalText: String) -> String? {
    // 这个循环的作用是提取出长度超过二的金额表达
    var i: Int = 0
    var result: String = ""

    while i < originalText.count {
        var ch: Character = originalText[i]

        while i < originalText.count,
              ChineseNumList.contains(ch) ||
              ChineseNumUnitList.contains(ch) ||
              ChineseMoneyUnitList.contains(ch)
        {
            result.append(ch)
            i = i + 1
            if i < originalText.count {
                ch = originalText[i]
            }
        }
        if i < originalText.count {
            i = i + 1
        }
        if result.count > 1 {
            return result
        } else {
            result = ""
        }
    }
    return nil
}

// 将中文的金额表达转为Float
// 没法转的话返回nil
// eg. 一百零五块三 -> 105.3
func ChineseAmount2Float(from originalText: String) -> Float? {
    var i: Int = 0
    var amount: Float = 0
    var ch: Character

    while i < originalText.count {
        ch = originalText[i]

        if ["十"].contains(ch) {
            amount = amount + 10
        }
        // 是数字就需要看前一个和后一个
        else if ChineseNumList.contains(ch) {
            if i < originalText.count - 1 {
                // 判断后面
                let ch_after: Character = originalText[i + 1]
                // 相当于个位 直接加
                if ["元", "块", "毛", "十", "百", "千", "万"].contains(ch_after) {
                    i = i + 1 // 跳过单位
                    amount = amount + GetValue(ch: ch) * GetValue(ch: ch_after)
                }
            } else if i != 0 {
                // 判断前面
                let ch_before: Character = originalText[i - 1]
                if ["块", "毛", "十", "百", "千", "万"].contains(ch_before) {
                    i = i + 1
                    amount = amount + GetValue(ch: ch) * GetValue(ch: ch_before) / 10
                } else {
                    amount += GetValue(ch: ch)
                }
            }
        }
        i = i + 1

        if i >= originalText.count {
            if amount != 0 {
                return amount
            } else {
                return nil
            }
        }
    }

    return nil
}

let ChineseNumList: [Character] = ["一", "二", "三", "四", "五", "六", "七", "八", "九", "两", "零"]
let ChineseNumUnitList: [Character] = ["十", "百", "千", "万"]
let ChineseMoneyUnitList: [Character] = ["元", "块", "毛", "点"]

let NumList: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
let NumMoneyUnitList: [Character] = [".", ","]

func GetValue(ch: Character) -> Float {
    switch ch {
    case "一":
        return 1
    case "二":
        return 2
    case "三":
        return 3
    case "四":
        return 4
    case "五":
        return 5
    case "六":
        return 6
    case "七":
        return 7
    case "八":
        return 8
    case "九":
        return 9
    case "两":
        return 2
    case "零":
        return 0
    case "元":
        return 1
    case "块":
        return 1
    case "毛":
        return 0.1
    case "十":
        return 10
    case "百":
        return 100
    case "千":
        return 1000
    case "万":
        return 10000
    default:
        return Float(String(ch)) ?? 0
    }
}

import Foundation

/// 寻找orinalText中的第一个名词
/// - Parameter originalText: 要转换的字符串
/// - Returns: orinalText中的第一个名词 不然返回nil
func OriginalText2FirstNoun(from originalText: String) -> String? {
    let (words, classes) = OriginalText2LexicalClass(from: originalText)

    if words == [] { return nil }

    for i in 0 ... words.count - 1 {
        if classes[i] == "Noun" {
            return words[i]
        }
    }
    return nil
}

/// 从originalText中提取event
/// - Parameter originalText: 原始字符串
/// - Returns: 有动名词词组返回；没有返回第一个名词；没有第一个名词返回nil
func OriginalText2Event(from originalText: String) -> String? {
    if originalText == "" { return nil }
    let (words, classes) = OriginalText2LexicalClass(from: originalText)

    var verbAndNounStringArray: [String] = [] // 找到动词加名词就往这个里面append，最后只看第一个就可以了
    if words.count > 1 {
        for i in 0 ... words.count - 2 {
            if classes[i] == "Verb", classes[i + 1] == "Noun" {
                verbAndNounStringArray.append(words[i] + words[i + 1])
            }
        }
    }

    if verbAndNounStringArray != [] {
        // 找到了动名词词组
        return verbAndNounStringArray[0]
    } else if let firstNoun: String = OriginalText2FirstNoun(from: originalText) {
        // 没找到动名词 返回第一个名词
        return firstNoun // 失败会返回nil刚好
    } else {
        return nil
    }
}

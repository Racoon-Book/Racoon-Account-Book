import Foundation
import NaturalLanguage

/// 从originalText中提取名词 这些名字就是自动生成的tag
/// - Parameter originalText: 要转换的字符串
/// - Returns: orinalText中的所有名词 不然返回空列表
func OriginalText2GeneratedTags(from originalText: String) -> [String] {
    let (words, classes) = OriginalText2LexicalClass(from: originalText)

    if words == [] { return [] }

    var nouns: [String] = []
    for i in 0 ... words.count - 1 {
        if classes[i] == "Noun" {
            nouns.append(words[i])
        }
    }
    return nouns
}

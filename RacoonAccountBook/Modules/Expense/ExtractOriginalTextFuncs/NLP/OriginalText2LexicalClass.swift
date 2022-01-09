import Foundation
import NaturalLanguage

/// 按顺序返回词和其词性
/// - Parameter originalText: 要转换的字符串
/// - Returns: (0, 1): 0 - 词 1 - 词性
func OriginalText2LexicalClass(from originalText: String) -> ([String], [String]) {
    if originalText == "" { return ([], []) }

    var tagWords: [String] = []
    var lexicalClasses: [String] = []

    let tagger = NLTagger(tagSchemes: [.lexicalClass])
    tagger.setLanguage(NLLanguage.simplifiedChinese, range: originalText.startIndex ..< originalText.endIndex)
    tagger.string = originalText
    let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]

    tagger.enumerateTags(in: originalText.startIndex ..< originalText.endIndex, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange in
        if let tag = tag {
            tagWords.append(String(originalText[tokenRange]))
            lexicalClasses.append(String(tag.rawValue))
        }
        return true
    }

    return (tagWords, lexicalClasses)
}

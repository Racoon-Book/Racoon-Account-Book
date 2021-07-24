import Foundation
import NaturalLanguage

// 从originalText中提取名词 这些名字就是自动生成的tag
func OriginalText2GeneratedTags(from originalText: String) -> [String] {
    var generatedTags: [String] = []

    let tagger = NLTagger(tagSchemes: [.lexicalClass])
    tagger.setLanguage(NLChinese, range: originalText.startIndex ..< originalText.endIndex)
    tagger.string = originalText
    let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace]

    tagger.enumerateTags(in: originalText.startIndex ..< originalText.endIndex, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange in
        if let tag = tag {
            if tag.rawValue == "Noun" || tag.rawValue == "Adjective" {
                // 是名词或者形容词就可以当作tag了
                generatedTags.append("\(originalText[tokenRange])")
            }
        }
        return true
    }

    return generatedTags
}

import Foundation

// 将generatedTags的第一个名词作为event
// TODO: 但是这样提取的event肯定不准确，一般来说event是需要包括东西的，比如`买东西``吃饭`etc
// 可以尝试着找前面有动词的名词
func OriginalText2Event(from originalText: String) -> String? {
    if originalText == "" {
        return nil
    }

    let generatedTags: [String] = OriginalText2GeneratedTags(from: originalText)

    return generatedTags.first
}

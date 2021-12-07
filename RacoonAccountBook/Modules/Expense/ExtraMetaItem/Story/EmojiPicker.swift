import Foundation
import SwiftUI

var emojiStickers: [String] = [
    // 喜
    "😃", "😄", "☺️", "😌", "😆", "🤓", "😎", "🥰", "😍", "🥳",
    // 有所思考
    "😅", "😀", "🧐", "🤨", "😂", "🙂",
    // 哀
    "😔", "😞", "😠", "😢", "🥲", "😤", "😭",
    // 其他
    "😜", "🥺",
]

struct EmojiPicker: View {
    static let width = CGFloat(50)

    @Binding var selectedEmoji: String

    var body: some View {
        VStack {
            Picker("Please choose an emoji", selection: $selectedEmoji) {
                ForEach(emojiStickers, id: \.self) {
                    Text($0)
                }
            }
            .frame(width: EmojiPicker.width)
            .clipped()
        }
    }
}

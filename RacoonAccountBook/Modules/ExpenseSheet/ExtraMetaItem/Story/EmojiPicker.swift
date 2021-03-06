import Foundation
import SwiftUI

var emojiStickers: [String] = [
    // ε
    "π", "π", "βΊοΈ", "π", "π", "π€", "π", "π₯°", "π", "π₯³",
    // ζζζθ
    "π", "π", "π§", "π€¨", "π", "π",
    // ε
    "π", "π", "π ", "π’", "π₯²", "π€", "π­",
    // εΆδ»
    "π", "π₯Ί",
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

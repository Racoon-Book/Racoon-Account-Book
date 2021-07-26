import Foundation
import SwiftUI
var emojiStickers: [String] = [
    // 喜
    "😄", "😃", "☺️", "😌", "😆", "🤓", "😎", "🥰", "😍", "🥳",
    // 有所思考
    "😅", "😀", "🧐", "🤨", "😂", "🙂",
    // 哀
    "😔", "😞", "😠", "😢", "🥲", "😤", "😭",
    // 其他
    "😜", "🥺",
]

struct EmojiPicker: View {
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = "Red"

    var body: some View {
        VStack {
            Picker("Please choose a color", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            Text("You selected: \(selectedColor)")
        }
    }
}

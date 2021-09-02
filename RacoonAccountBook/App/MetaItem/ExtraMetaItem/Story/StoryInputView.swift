import SwiftDate
import SwiftUI

struct StoryInputView: View {
    @Binding var metadata_inputting: ExpenseInfo

    @State private var rating = StarRating.three

    @State private var selectedEmoji: String = emojiStickers.first!

    static let height = CGFloat(90)

    @Binding var showingStoryInputView: Bool

    var body: some View {
        HStack {
            VStack {
                Text("财记")
                    .font(.system(.headline))
                    .padding([.bottom], 1)

                // 关闭财记的按钮：删除财记且设置showing为false
                Button(action: {
                    metadata_inputting.story = nil
                    showingStoryInputView = false
                }, label: {
                    Text(Image(systemName: "multiply.square"))
                        .font(.system(.headline))
                        .foregroundColor(.black)
                })
            }
            .frame(height: StoryInputView.height)

            HStack {
                VStack {
                    HStack {
                        RatingButtonView(rating: $rating)
                            .onChange(of: rating) { _ in
                                UpdateStoryRating()
                            }
                        Spacer() // 如果不加这个 四星和五星受到Picker影响没法点
                    }
                    StoryField(
                        metadata_inputting: $metadata_inputting,
                        hint: "添加财记～")
                }
                .padding([.horizontal], 4)

                EmojiPicker(selectedEmoji: $selectedEmoji)
                    .onChange(of: selectedEmoji, perform: { _ in
                        UpdateStoryEmoji()
                    })
            }

            .frame(height: StoryInputView.height)
        }
        .padding([.vertical], 5) // 别和上下挨的太近
    }

    private func UpdateStoryRating() {
        // FIXME: 之后添加是否显示story之后，onAppear就先创建story story删除之后重新置story为nil
        if metadata_inputting.story == nil {
            metadata_inputting.story = ExpenseInfo.Story(
                rating: Int(rating.rawValue),
                emoji: nil,
                text: nil)
        } else {
            metadata_inputting.story!.update(rating: Int(rating.rawValue))
        }
    }

    private func UpdateStoryEmoji() {
        if metadata_inputting.story == nil {
            metadata_inputting.story = ExpenseInfo.Story(rating: nil, emoji: selectedEmoji, text: nil)
        } else {
            metadata_inputting.story!.update(emoji: selectedEmoji)
        }
    }
}

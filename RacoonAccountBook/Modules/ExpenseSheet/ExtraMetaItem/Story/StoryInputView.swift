import SwiftDate
import SwiftUI

struct StoryInputView: View {
    @Binding var expenseInfo_inputting: ExpenseInfo

    init(expenseInfo_inputting: Binding<ExpenseInfo>, showingStoryInputView: Binding<Bool>) {
        _expenseInfo_inputting = expenseInfo_inputting
        _showingStoryInputView = showingStoryInputView

        // 有story就将初值设置为story.rating
        _rating = State(initialValue:
            (expenseInfo_inputting.story.wrappedValue == nil) ?
                3 :
                (expenseInfo_inputting.story.wrappedValue!.rating ?? 3))

        // 有emoji就将初值设置为story.emoji
        _selectedEmoji = State(initialValue:
            (expenseInfo_inputting.story.wrappedValue == nil) ?
                emojiStickers.first! :
                (expenseInfo_inputting.story.wrappedValue!.emoji ?? emojiStickers.first!))
    }

    @State private var rating: Int

    @State private var selectedEmoji: String

    @Binding var showingStoryInputView: Bool

    static let height = CGFloat(90)

    var body: some View {
        HStack {
            VStack {
                Text("财记")
                    .font(.system(.headline))
                    .padding([.bottom], 1)

                // 关闭财记的按钮：删除财记且设置showing为false
                Button(action: {
                    expenseInfo_inputting.story = nil
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
                        story: $expenseInfo_inputting.story,
                        hint: "添加财记～"
                    )
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
        if expenseInfo_inputting.story == nil {
            expenseInfo_inputting.story = ExpenseInfo.Story(
                rating: rating,
                emoji: nil,
                text: nil
            )
        } else {
            expenseInfo_inputting.story!.update(rating: rating)
        }
    }

    private func UpdateStoryEmoji() {
        if expenseInfo_inputting.story == nil {
            expenseInfo_inputting.story = ExpenseInfo.Story(rating: nil, emoji: selectedEmoji, text: nil)
        } else {
            expenseInfo_inputting.story!.update(emoji: selectedEmoji)
        }
    }
}

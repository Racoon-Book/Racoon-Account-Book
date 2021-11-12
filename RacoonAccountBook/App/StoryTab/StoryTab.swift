import SwiftDate
import SwiftUI

struct StoryTab: View {
    @Environment(\.managedObjectContext) var context

    @FetchRequest(fetchRequest: Expense.request_allExpensesWithStory)
    var expensesWithStory

    static let emojiSize: CGFloat = 50

    var body: some View {
        // TODO: 像账本那样做一个深色的统计页面应该比较好

        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    if expensesWithStory.count != 0 {
                        ForEach(expensesWithStory) { expense in
                            // 换成一个单另的View之后 ForEach的更新就不work了

                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(DisplayDate(expense.spentAt.convertTo(region: regionChina))) \(expense.event)")
                                        .bold()
                                        .foregroundColor(defaultColorSet.cardTitle)

                                    Spacer()
                                }
                                .padding([.top, .leading])

                                // seperator
                                Rectangle()
                                    .fill(defaultColorSet.tabBackground)
                                    .frame(height: 1)

                                VStack(alignment: .leading) {
                                    // contentView
                                    let amountFormatted = String(format: "¥%.1f", expense.amount)
                                    let text = expense.story?.text ?? "为本次花销添加一段财记吧"

                                    Text(text)
                                        .font(.body)

                                    HStack(alignment: .center) {
                                        if let emoji = expense.story?.emoji {
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 12)
                                                    .foregroundColor(defaultColorSet.emojiBackground)
                                                Text(emoji)
                                                    .font(.title)
                                            }
                                            .frame(width: Self.emojiSize, height: Self.emojiSize, alignment: .center)

                                            Spacer()
                                        }

                                        Text(amountFormatted)
                                            .font(.system(.title, design: .rounded))
                                            .foregroundColor(Color.blue)

                                        Spacer()

                                        if let rating = expense.story?.rating {
                                            RatingView(rating: Int(rating))
                                        }
                                    }
                                }
                                .padding([.horizontal, .bottom])
                            }
                            .frame(width: UIScreen.main.bounds.width - 20)
                            .background(Color.white)
                            .cornerRadius(10)
                            .clipped()
                        }
                        .padding(.horizontal, 10) // 让圆角矩形边框不靠边
                    }
                    else {
                        Text("一笔财记还没有呢")
                        Text("给花销添加背后故事吧！").font(.system(.title2))
                    }
                }

                .padding(.vertical, 10) // 让上下两个stroy不靠边
                .navigationTitle("最近的财记")
                .navigationBarTitleDisplayMode(.inline)
            }
            .background(defaultColorSet.tabBackground.ignoresSafeArea())
        }
    }
}

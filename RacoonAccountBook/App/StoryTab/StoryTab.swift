import SwiftDate
import SwiftUI

struct StoryTab: View {
    @Environment(\.managedObjectContext) var context

    @FetchRequest(fetchRequest: Expense.request_allExpensesWithStory)
    var expensesWithStory
    
    static let emojiSize:CGFloat = 50

    var body: some View {
        // TODO: 像账本那样做一个深色的统计页面应该比较好
        if expensesWithStory.count != 0 {
            NavigationView {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(expensesWithStory) { expense in
                            // 换成一个单另的View之后 ForEach的更新就不work了
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(defaultColorSet.cardBackground)

                                VStack(alignment: .leading) {
                                    let text = expense.story?.text ?? "为本次花销添加一段财记吧"
                                    let amountFormatted = String(format: "%.1f", expense.amount)

                                    Text(DisplayDate(expense.spentAt.convertTo(region: regionChina)))
                                        .font(.title3)
                                        .padding(.top, 6.0)

                                    Text("在\(expense.event)上花了\(amountFormatted)元")
                                        .font(.title2)
                                        .padding(.vertical, 9.0)

                                    Text(text)
                                        .font(.body)

                                    HStack(alignment: .center) {
                                        if let rating = expense.story?.rating {
                                            RatingView(rating: Int(rating))
                                        }

                                        Spacer()

                                        if let emoji = expense.story?.emoji {
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 12)
                                                    .foregroundColor(defaultColorSet.emojiBackground)
                                                Text(emoji)
                                                    .font(.title)
                                            }
                                            .frame(width: Self.emojiSize, height: Self.emojiSize, alignment: .center)
                                        }
                                    }
                                }
                                .padding(.horizontal, 10) // 字和左右边框的
                            }
                        }
                        .padding(.horizontal, 10) // 让圆角矩形边框不靠边
                    }
                }
                .padding(.vertical, 10) // 让上下两个stroy不靠边
                .background(defaultColorSet.tabBackground.ignoresSafeArea())
                .navigationTitle("最近的财记")
                .navigationBarTitleDisplayMode(.inline)
            }
        } else {
            Text("一笔财记还没有呢 给自己的花销添加故事吧！")
        }
    }
}

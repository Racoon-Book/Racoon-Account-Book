import SwiftDate
import SwiftUI

struct StoryTab: View {
    @Environment(\.managedObjectContext) var context

    @FetchRequest(fetchRequest: Expense.request_allExpensesWithStory)
    var expensesWithStory

    var body: some View {
        // TODO: 像账本那样做一个深色的统计页面应该比较好
        if expensesWithStory.count != 0 {
            NavigationView {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(expensesWithStory) { expense in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("StoryBG"))

                                VStack(alignment: .leading) {
                                    let text = expense.story?.text ?? "为本次花销添加一段财记吧"
                                    let amountFormatted = String(format: "%.1f", expense.amount)

                                    Text(DisplayDate(expense.spentAt.convertTo(region: regionChina)))
                                        .font(.caption)
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
                                            Text(emoji)
                                                .font(.title)
                                        }
                                    }
                                }
                                .padding(.all, 10)
                            }
                        }
                        .padding(.horizontal, 10) // 让圆角矩形边框不靠边
                    }
                }
                .padding(.vertical, 10) // 让上下两个stroy不靠边
                .navigationTitle("最近的财记")
                .navigationBarTitleDisplayMode(.inline)
            }
        } else {
            Text("一笔财记还没有呢 给自己的花销添加故事吧！")
        }
    }
}

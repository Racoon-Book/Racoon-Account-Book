import SwiftDate
import SwiftUI

struct StoryTab: View {
    @Environment(\.managedObjectContext) var context

    @FetchRequest(fetchRequest: Expense.request_allExpensesWithStory)
    var enpensesWithStory

    var body: some View {
        // TODO: 像账本那样做一个深色的统计页面应该比较好
        if enpensesWithStory.count != 0 {
            NavigationView {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(enpensesWithStory, id: \.self) { expense in
                            ItemStoryView(expense: expense)
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

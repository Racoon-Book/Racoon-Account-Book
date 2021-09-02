import SwiftDate
import SwiftUI

struct StoryTab: View {
    @Environment(\.managedObjectContext) var context

    var body: some View {
        let expenses = Expense.all(context: context, story_only: true)

        // TODO: 像账本那样做一个深色的统计页面应该比较好
        if expenses.count != 0 {
            NavigationView {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(expenses, id: \.self) { expense in
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
            Text("Error in StoryTab")
        }
    }
}

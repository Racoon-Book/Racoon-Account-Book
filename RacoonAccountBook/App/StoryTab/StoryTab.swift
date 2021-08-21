import SwiftDate
import SwiftUI

struct StoryTab: View {
    @Environment(\.managedObjectContext) var context

    var body: some View {
        let expenses = Expense.all(context: context, story_only: true)

        // TODO: 像账本那样做一个深色的统计页面应该比较好
        if expenses.count != 0 {
            NavigationView {
                VStack {
                    ScrollViewReader { scrollView in
                        ScrollView(.vertical) {
                            VStack {
                                ForEach(expenses, id: \.self) { expense in
                                    ItemStoryView(expense: expense)
                                }
                                .padding(.horizontal, 10) // 让圆角矩形边框不靠边
                            }
                            .onAppear {
                                // 出现的时候滑到最下面
                                scrollView.scrollTo(expenses.last?.id) // FIXME: 这个没效果不知道为什么 感觉好像和账本页面的ScrollView冲突了 可能排个序就好了
                            }
                        }.padding([.vertical], 5) // 让上下两个stroy不靠边
                    }
                }
                .navigationTitle("最近的财记")
                .navigationBarTitleDisplayMode(.inline)
                .edgesIgnoringSafeArea(.top)
            }

        } else {
            Text("Error in StoryTab")
        }
    }
}

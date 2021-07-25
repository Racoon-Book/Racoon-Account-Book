import SwiftDate
import SwiftUI

struct StoryTab: View {
    @EnvironmentObject var RacoonAccountBook: AccountBookModel

    var body: some View {
        let items = RacoonAccountBook.wholeBook.items
            .filter { $0.metadata.story != nil }

        NavigationView {
            VStack {
                // TODO: 像账本那样做一个深色的统计页面应该比较好
                Text("像账本那样做一个深色的统计页面应该比较好")
                    .padding(10)

                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(items) { item in
                            ItemStoryView(item: item)
                        }
                        .padding(.horizontal, 10) // 让圆角矩形边框不靠边
                    }
                }
            }
            .navigationTitle("最近的财记")
            .navigationBarTitleDisplayMode(.inline)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct StoryTab_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        StoryTab()
            .environmentObject(PreviewAccountBook)
    }
}

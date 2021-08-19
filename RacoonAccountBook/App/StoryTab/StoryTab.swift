import SwiftDate
import SwiftUI

struct StoryTab: View {
    @EnvironmentObject var RacoonAccountBook: AccountBookModel

    var body: some View {
        let items = RacoonAccountBook.getExWithStory().items

        // TODO: 像账本那样做一个深色的统计页面应该比较好
        if items.count != 0 {
            NavigationView {
                VStack {
                    ScrollViewReader { _ in
                        ScrollView(.vertical) {
                            VStack {
                                ForEach(items, id: \.self) { item in
                                    ItemStoryView(metadata: .constant(item.metadata))
                                }
                                .padding(.horizontal, 10) // 让圆角矩形边框不靠边
                            }
//                            .onAppear {
//                                // 出现的时候滑到最下面
//                                scrollView.scrollTo(items.last?.id) // FIXME: 这个没效果不知道为什么 感觉好像和账本页面的ScrollView冲突了
//                            }
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

struct StoryTab_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        StoryTab()
            .environmentObject(PreviewAccountBook)
    }
}

import SwiftUI

struct StoryReportCardContent: View {
    /// 历史财记总数
    var storyCount: Int = 0

    var body: some View {
        VStack(alignment: .leading) {
            // TODO: 添加词云和emoji，从已有的记账中筛选

            if storyCount == 0 {
                Text("你还没有添加一笔财记哦，快去记录你在花销时的心情吧！")
            } else {
                Text("使用浣熊财记以来，你记录了") +
                    Text(" \(storyCount) ").font(.system(.title, design: .rounded)) +
                    Text("条财记。")
                Text("里面有你的生活，有你的心情。")
            }
        }
    }
}

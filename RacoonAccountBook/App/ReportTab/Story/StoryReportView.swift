// HabitView.swift

import SwiftUI

struct StoryReportView: View {
    var body: some View {
        // TODO: 这里要用CoreData获取对应的数据
        CardSeperatorView(title: "习惯统计", contentView: AnyView(HabitReportCard()))
        CardSeperatorView(title: "财记统计", contentView: AnyView(StoryReportCard()))
    }
}

struct HabitReportCard: View {
    /// 过去30天内财记总数
    var expenseCount: Int = 1 // TODO: 这里要做成可变的

    var body: some View {
        VStack(alignment: .leading) {
            // TODO: 添加日历 用带有颜色的圈圈出记过账的日期

            if expenseCount == 0 {
                Text("在过去的30天内，你似乎还没有记账呢。用浣熊财记开启你的记账之旅吧！")
            } else {
                Text("在过去的") +
                    Text(" 30 ").font(.system(.title2, design: .rounded)) +
                    Text("天内，你共记了") +
                    Text(" \(expenseCount) ").font(.system(.title, design: .rounded)) +
                    Text("笔账。")
                Text("记一块有一块的欢喜。")
            }
        }
    }
}

struct StoryReportCard: View {
    /// 历史财记总数
    var storyCount: Int = 1 // TODO: 这里要做成可变的

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

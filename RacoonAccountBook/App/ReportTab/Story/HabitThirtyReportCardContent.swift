import SwiftUI

struct HabitThirtyReportCardContent: View {
    /// 过去30天内财记总数
    var expenseCount: Int = 0

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

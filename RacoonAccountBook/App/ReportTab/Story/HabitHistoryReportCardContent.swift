import SwiftUI

struct HabitHistoryReportCardContent: View {
    /// 过去30天内财记总数
    var expenseCount: Int = 0

    var body: some View {
        VStack(alignment: .leading) {
            // TODO: 添加日历 用带有颜色的圈圈出记过账的日期

            if expenseCount == 0 {
                Text("使用浣熊财记以来，你似乎还没有记账呢。用浣熊财记开启你的记账之旅吧！")
            } else {
                Text("使用浣熊财记以来，你共记了") +
                    Text(" \(expenseCount) ").font(.system(.title, design: .rounded)) +
                    Text("笔账。")
                Text("看样子已经走上了坚持记账的道路呢！")
            }
        }
    }
}

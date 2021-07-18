import SwiftDate
import SwiftUI

struct MetaItemView: View {
    var metadata: MetaItem

    var body: some View {
        let event_display: String = metadata.event
        let amount_dispaly = String(format: "%.1f", metadata.amount_float)

        // Check https://github.com/malcommac/SwiftDate/blob/master/Documentation/4.Compare_Dates.md#41---extended-comparison-with-presets
        let isYesterday: Bool = metadata.spentMoneyAt.compare(.isYesterday)
        let isToday: Bool = metadata.spentMoneyAt.compare(.isToday)
        let isTomorrow: Bool = metadata.spentMoneyAt.compare(.isTomorrow)
        let formatDate: String = metadata.spentMoneyAt.toFormat("M/d EEEE", locale: Locales.chineseChina)

        let date_display: String = isToday ? "今天" : isYesterday ? "昨天" : isTomorrow ? "明天" : formatDate // 好像就只有用问号冒号表达式了，`.onAppear{}` 不起作用啊
        // TODO: 这里需要设计一下相对时间都怎么说，比如上周四，上月多少号；年份和月份应该是分组的。因此普通显示是 M/d 但是星期只有在上周和这周还有点用处，再往前星期应该没必要
        // 可以参考一下WeChat的时间显示

        HStack {
            VStack(alignment: .leading) {
                if metadata.event != "" {
                    Text(event_display)
                        .bold()
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding([.horizontal, .top], 3)
                } else {
                    Text("请记录你的花销")
                        .bold()
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .padding([.horizontal, .top], 3)
                }

                Text(date_display)
                    .foregroundColor(.secondary)
                    .padding([.top], 1)
                    .padding([.horizontal, .bottom], 3)
            }

            Spacer()

            Text(amount_dispaly)
                .font(.title)
                .foregroundColor(.black)
//                .padding([.horizontal])
        }
    }
}

struct MetaItemView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        BookTabView(RacoonAccountBook: PreviewAccountBook)
        AddTabView(RacoonAccountBook: PreviewAccountBook)
    }
}

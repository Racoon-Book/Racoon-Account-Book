import SwiftDate
import SwiftUI

struct MetaItemView: View {
    var metadata: AccountBook.MetaItem

    var body: some View {
        let event_display: String = metadata.event
        let amount_dispaly = String(format: "%.1f", metadata.amount_float)

        // Check https://github.com/malcommac/SwiftDate/blob/master/Documentation/4.Compare_Dates.md#41---extended-comparison-with-presets
        let isYesterday: Bool = metadata.spentMoneyAt.compare(.isYesterday)
        let isToday: Bool = metadata.spentMoneyAt.compare(.isToday)
        let isTomorrow: Bool = metadata.spentMoneyAt.compare(.isTomorrow)
        let formatDate: String = metadata.spentMoneyAt.toFormat("M/d EEEE", locale: Locales.chineseChina)

        let date_display: String = isToday ? "今天" : isYesterday ? "昨天" : isTomorrow ? "明天" : formatDate // 好像就只有用问号冒号表达式了，`.onAppear{}` 不起作用啊

        HStack {
            VStack(alignment: .leading) {
                Text(event_display)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.primary)
                Text(date_display)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(amount_dispaly)
                .font(.title)
                .foregroundColor(.black)
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

import SwiftDate
import SwiftUI

struct DayItemsView: View {
    var date: DateInRegion
    var dayItems: [Item] = []

    var body: some View {
        let isYesterday: Bool = date.compare(.isYesterday)
        let isToday: Bool = date.compare(.isToday)
        let isTomorrow: Bool = date.compare(.isTomorrow)

        // `今天` `昨天` `明天`各自显示；是`这一周`和`上一周`则显示星期；其他的不显示星期
        let date_display: String =
            isToday ? date.toFormat("M月d日  今天", locale: Locales.chineseChina) :
            isYesterday ? date.toFormat("M月d日  昨天", locale: Locales.chineseChina) :
            isTomorrow ? date.toFormat("M月d日  明天", locale: Locales.chineseChina) :
            date.compare(.isThisWeek) || date.compare(.isLastWeek) ? date.toFormat("M月d日 EEEE", locale: Locales.chineseChina) :
            date.toFormat("M月d日", locale: Locales.chineseChina)

        if dayItems.count != 0 {
            ZStack {
                // 浅色圆角矩形背景
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color("AntiqueWhite"))

                // 一天的所有花销条目列出来
                VStack(alignment: .leading) {
                    Text(date_display)
                        .padding([.top], 10)
                        .font(.system(.title2))

                    ForEach(dayItems, id: \.self) { item in
                        MetaItemView(metadata: item.metadata)
                            .padding([.top], 1)
                    }
                }
                .padding([.horizontal], 10)
                .padding([.bottom], 10)
            }

        } else {
            EmptyView()
        }
    }
}

struct DayItemsView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
//        let items: [Item] = [PreviewAccountBook.wholeBook.items[0], PreviewAccountBook.wholeBook.items[1], PreviewAccountBook.wholeBook.items[2]]
//        VStack {
//            Spacer()
//            DayItemsView(date: DateInRegion(year: 2021, month: 7, day: 18, region: regionChina), dayItems: items)
//            Spacer()
//        }

        BookTabView(RacoonAccountBook: PreviewAccountBook)
    }
}

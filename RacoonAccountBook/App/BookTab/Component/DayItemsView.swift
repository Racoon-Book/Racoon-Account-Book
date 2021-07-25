import SwiftDate
import SwiftUI

struct DayItemsView: View {
    var date: DateInRegion
    var dayItems: [Item] = []

    var body: some View {
        let date_display: String = DisplayDate(date)

        if dayItems.count != 0 {
            ZStack {
                // 浅色圆角矩形背景
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color("AntiqueWhite"))

                // 一天的所有花销条目列出来
                VStack(alignment: .leading) {
                    Text(date_display)
                        .padding([.top], 10) // 日期上面的padding
                        .font(.system(.title2))

                    ForEach(dayItems, id: \.self) { item in
                        // TODO: 一天内的花销按添加顺序排列
                        MetaItemView(metadata: item.metadata)
                            .padding([.top], 1)
                    }
                }
                .padding([.horizontal], 10) // 日期和花销两边的padding
                .padding([.bottom], 10) // 最后一个条目下面的padding
            }

        } else {
            EmptyView() // 不显示没有items的天
        }
    }
}

struct DayItemsView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        BookTab()
            .environmentObject(PreviewAccountBook)

        let items: [Item] = [PreviewAccountBook.wholeBook.items[0], PreviewAccountBook.wholeBook.items[1], PreviewAccountBook.wholeBook.items[2]]
        VStack {
            Spacer()
            DayItemsView(
                date: DateInRegion(year: 2021, month: 7, day: 18, region: regionChina),
                dayItems: items)
            Spacer()
        }
    }
}

import SwiftUI
import SwiftDate

struct MetaItemView: View {
    var metadata: AccountBook.MetaItem

    var body: some View {
        let event: String = metadata.event
        let date: String = metadata.spentMoneyAt.toFormat("MM/dd, EEEE",locale: Locales.chineseChina)
        let amount: String = String(format: "%.1f", metadata.amount_float)

        HStack {
            VStack(alignment: .leading) {
                Text(event)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.primary)
                Text(date)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(amount)
                .font(.title)
        }
    }
}

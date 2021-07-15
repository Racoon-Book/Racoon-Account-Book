import SwiftDate
import SwiftUI

struct MetaItemView: View {
    var metadata: AccountBook.MetaItem

    var body: some View {
        let event: String = metadata.event
        let date: String = metadata.spentMoneyAt.toFormat("M/d EEEE", locale: Locales.chineseChina)
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

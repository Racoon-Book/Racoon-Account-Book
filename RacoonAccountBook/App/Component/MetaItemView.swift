import SwiftDate
import SwiftUI

// [用来显示一个条目的View]
struct MetaItemView: View {
    var metadata: MetaItem

    var body: some View {
        let event_display: String = metadata.event
        let amount_dispaly = String(format: "%.1f", metadata.amount_float)

        HStack {
            VStack(alignment: .leading) {
                if metadata.event != "" {
                    Text(event_display)
                        .bold()
                        .font(.title2)
                        .foregroundColor(.primary)
                } else {
                    Text("请记录你的花销")
                        .bold()
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
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
        BookTab()
            .environmentObject(PreviewAccountBook)
        OrdinaryAddView()
            .environmentObject(PreviewAccountBook)
    }
}

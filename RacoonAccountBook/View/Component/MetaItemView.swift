import SwiftUI

struct MetaItemView: View {
    var metadata: AccountBook.MetaItem

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(metadata.category)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.primary)
                Text(metadata.originalText)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(String(format: "%.1f", metadata.amount_float)).font(.title)
        }
    }
}

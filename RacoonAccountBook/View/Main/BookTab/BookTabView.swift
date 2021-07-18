import SwiftUI

struct BookTabView: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel // FIXME: 这里应该用绑定的

    var body: some View {
        VStack {
            IncomeExpenditureView()
                .padding(10)

            List {
                ForEach(RacoonAccountBook.items) { item in
                    MetaItemView(metadata: item.metadata)
                }
            }
        }
    }
}

struct BookTabView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook: AccountBookModel = AccountBookModel()

    static var previews: some View {
        BookTabView(RacoonAccountBook: PreviewAccountBook)
    }
}

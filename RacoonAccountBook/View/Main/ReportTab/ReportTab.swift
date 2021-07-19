import SwiftDate
import SwiftUI

struct ReportTab: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel // FIXME: 这里应该用绑定的

    var body: some View {
        VStack {
            Text("ReportTab")
        }
    }
}

//struct ReportTab_Previews: PreviewProvider {
//    @StateObject static var PreviewAccountBook = AccountBookModel()
//
//    static var previews: some View {
//        BookTab(RacoonAccountBook: PreviewAccountBook)
//    }
//}

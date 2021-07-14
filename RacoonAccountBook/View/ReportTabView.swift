import SwiftUI

struct ReportTabView: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel // FIXME: 这里应该用绑定的

    var body: some View {
        VStack {
            Text("ReportTabView")
            
        }
    }
}



struct ReportTabView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook: AccountBookModel = AccountBookModel()

    static var previews: some View {
        BookTabView(RacoonAccountBook: PreviewAccountBook)
    }
}

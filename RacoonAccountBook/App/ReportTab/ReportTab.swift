import SwiftDate
import SwiftUI

struct ReportTab: View {
    @EnvironmentObject var RacoonAccountBook: AccountBookModel

    var body: some View {
        VStack {
            Text("ReportTab")
        }
    }
}

struct ReportTab_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        StoryTab()
            .environmentObject(PreviewAccountBook)
    }
}

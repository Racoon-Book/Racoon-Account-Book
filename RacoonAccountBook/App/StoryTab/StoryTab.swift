import SwiftUI

struct StoryTab: View {
    @EnvironmentObject var RacoonAccountBook: AccountBookModel

    var body: some View {
        Text("StoryTab")
    }
}

struct StoryTab_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        StoryTab()
            .environmentObject(PreviewAccountBook)
    }
}

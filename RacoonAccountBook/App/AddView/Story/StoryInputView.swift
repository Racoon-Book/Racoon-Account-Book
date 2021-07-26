import SwiftDate
import SwiftUI

struct StoryInputView: View {
    @Binding var metadata_inputting: MetaItem

    @State private var rating = StarRating.three

    var body: some View {
        HStack {
            Text("财记")
                .font(.system(.headline))

            VStack {
                HStack {
                    RatingButtonView(rating: $rating)
                    Spacer()
                    Text("😶") // TODO: Sticker
                }

                StoryField(
                    metadata_inputting: $metadata_inputting,
                    hint: "添加财记～")
                    .padding([.horizontal], 4)
            }
        }
        .padding([.vertical], 5) // 别和上下挨的太近
    }
}

struct StoryInputView_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        OrdinaryAddSheet(
            addUIConfig: .constant(
                AddUIConfig(isShowingOrdinaryAddView: true,
                            isShowingVoiceInputView: false)),
            metadata_inputting: .constant(
                MetaItem(
                    originalText: "",
                    spentMoneyAt: DateInRegion(region: regionChina),
                    event: "买饮料",
                    amount_float: 3.5)),
            amount_string_inputting: .constant("3.5"))
    }
}

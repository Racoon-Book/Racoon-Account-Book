import SwiftUI

struct StoryInputView: View {
    @Binding var metadata_inputting: MetaItem

    @State private var rating: StarRating = StarRating.three

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
                    hint: "添加财记～"
                )
                .padding([.horizontal], 4)
            }
        }
    }
}

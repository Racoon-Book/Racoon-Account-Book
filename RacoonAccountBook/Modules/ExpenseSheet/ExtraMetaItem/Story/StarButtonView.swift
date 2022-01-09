import SwiftUI

// 使用方法
// struct MainView: View {
//    @State var rating: StarRating = StarRating.three
//
//    var body: some View {
//        VStack {
//            RatingButtonView(rating: $rating)
//        }
//    }
// }

struct RatingButtonView: View {
    @Binding var rating: Int

    var body: some View {
        HStack {
            SingleStarButtonView(rating: $rating, starPosition: 1)
            SingleStarButtonView(rating: $rating, starPosition: 2)
            SingleStarButtonView(rating: $rating, starPosition: 3)
            SingleStarButtonView(rating: $rating, starPosition: 4)
            SingleStarButtonView(rating: $rating, starPosition: 5)
        }
        .foregroundColor(Color.yellow)
        .font(.system(size: 20))
    }
}

// rating 评价 枚举类型
struct SingleStarButtonView: View {
    @Binding var rating: Int
    var starPosition: Int

    var body: some View {
        Button(action: {
            withAnimation(.default) {
                rating = starPosition
            }
        }) {
            Image(systemName: rating >= starPosition ? "star.fill" : "star")
        }
    }
}

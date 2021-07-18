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

// TODO: 滑动改变评级
struct RatingButtonView: View {
    @Binding var rating: StarRating

    var body: some View {
        HStack {
            SingleStarButtonView(rating: $rating, starPosition: .one)
            SingleStarButtonView(rating: $rating, starPosition: .two)
            SingleStarButtonView(rating: $rating, starPosition: .three)
            SingleStarButtonView(rating: $rating, starPosition: .four)
            SingleStarButtonView(rating: $rating, starPosition: .five)
        }
        .foregroundColor(Color.yellow)
        .font(.system(size: 40))
    }
}

// rating 评价 枚举类型
struct SingleStarButtonView: View {
    @Binding var rating: StarRating
    var starPosition: StarRating

    var body: some View {
        Button(action: {
            withAnimation(.default) {
                rating = starPosition
            }

            printLog("[SingleStarButtonView] 用户评了\(starPosition.rawValue)星")
        }) {
            Image(systemName: rating.rawValue >= starPosition.rawValue ? "star.fill" : "star")
        }
    }
}

// TODO: 之后如果要添加半颗星，添加枚举类型就好了
enum StarRating: Float {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RatingButtonView(rating: .constant(.three))
            RatingButtonView(rating: .constant(.four))
        }
    }
}

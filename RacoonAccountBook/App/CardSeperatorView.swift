import SwiftUI

struct CardSeperatorView: View {
    var cardCornerRadius: CGFloat = 10
    var cardWidth: CGFloat = UIScreen.main.bounds.width - 20
    var cardBackgroundColor: Color = .white

    var dividerColor: Color = defaultColorSet.tabBackground
    var dividerHeight: CGFloat = 1

    var title: String // 之后删掉这个 没有初值 必须初始化
    var titleColor: Color = defaultColorSet.cardTitle

    var contentView: some View = DefaultContentView()

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text(title)
                    .bold()
                    .foregroundColor(titleColor)

                Spacer()
            }
            .padding([.top, .leading])

            Rectangle()
                .fill(dividerColor)
                .frame(height: dividerHeight)

            VStack(alignment: .center) {
                contentView
            }
            .padding([.horizontal, .bottom])
        }
        .frame(width: cardWidth)
        .background(cardBackgroundColor)
        .cornerRadius(cardCornerRadius)
        .clipped()
    }
}

// func DefaultContentViewFunc() -> View {
//    return Text("test ContentView")
// }

struct DefaultContentView: View {
    var body: some View {
        Text("test ContentView")
    }
}

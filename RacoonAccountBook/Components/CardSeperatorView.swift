import SwiftUI

struct CardSeperatorView: View {
    var cardCornerRadius: CGFloat = 10
    var cardWidth: CGFloat = UIScreen.main.bounds.width - 20
    var cardBackgroundColor: Color = .white

    var dividerColor: Color = defaultColorSet.tabBackground
    var dividerHeight: CGFloat = 1

    var title: String
    var titleColor: Color = defaultColorSet.cardTitle

    var contentView = AnyView(DefaultContentView())

    var body: some View {
        VStack(alignment: .leading) {
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

            VStack(alignment: .leading) {
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

struct DefaultContentView: View {
    var body: some View {
        Text("test ContentView")
    }
}

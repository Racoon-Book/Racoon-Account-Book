import SwiftUI

struct RatingView: View {
    var rating: Int

    var body: some View {
        HStack(alignment: .center) {
            ForEach(0 ..< rating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(.title3))
            }

            ForEach(rating ..< 5, id: \.self) { _ in
                Image(systemName: "star")
                    .foregroundColor(.yellow)
                    .font(.system(.title3))
            }
        }
    }
}

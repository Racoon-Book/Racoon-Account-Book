//
//  RatingView.swift
//  RacoonAccountBook
//
//  Created by c0per chen on 7/25/21.
//

import SwiftUI

struct RatingView: View {
    var rating: Int

    var body: some View {
        HStack(alignment: .center) {
//            Text("价值")
//                .font(.title3)

            ForEach(0 ..< rating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }

            ForEach(rating ..< 5, id: \.self) { _ in
                Image(systemName: "star")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.top, 10.0)
    }
}

// struct RatingView_Previews: PreviewProvider {
//    @StateObject static var PreviewAccountBook = AccountBookModel()
//
//    static var previews: some View {
//        RatingView(rating: 3)
//
//        ItemStoryView(item: PreviewAccountBook.wholeEx.items[164])
//
//        StoryTab()
//            .environmentObject(PreviewAccountBook)
//    }
// }

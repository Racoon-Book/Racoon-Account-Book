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

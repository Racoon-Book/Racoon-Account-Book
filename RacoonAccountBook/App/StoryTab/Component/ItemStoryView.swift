//
//  ItemStoryView.swift
//  RacoonAccountBook
//
//  Created by c0per chen on 7/25/21.
//

import SwiftUI
import SwiftDate

struct ItemStoryView: View {
    //var metadata: MetaItem
    var expense: Expense

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("StoryBG"))

            VStack(alignment: .leading) {
                let text = expense.story?.text ?? "为本次花销添加一段财记吧"
                let amountFormatted = String(format: "%.1f", expense.amount_float)

                //Text(DisplayDate(expense.spentAt))
                Text(DisplayDate(DateInRegion(region: regionChina)))
                    .font(.caption)
                    .padding(.top, 6.0)

                Text("在\(expense.event!)上花了\(amountFormatted)元")
                    .font(.title2)
                    .padding(.vertical, 9.0)

                Text(text)
                    .font(.body)

                HStack(alignment: .center) {
                    if let rating = expense.story?.rating {
                        RatingView(rating: Int(rating))
                    }

                    Spacer()

                    if let emoji = expense.story?.emoji {
                        Text(emoji)
                            .font(.title)
                    }
                }
            }
            .padding(.all, 10)
        }
    }
}

//
//  ItemStoryView.swift
//  RacoonAccountBook
//
//  Created by c0per chen on 7/25/21.
//

import SwiftUI

struct ItemStoryView: View {
    @Binding var item: Item

    var body: some View {
        let data = item.metadata
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("StoryBG"))

            VStack(alignment: .leading) {
                let text = data.story?.text ?? "为本次花销添加一段财记吧"
                let amountFormatted = String(format: "%.1f", data.amount_float)

                Text(DisplayDate(data.spentMoneyAt))
                    .font(.caption)
                    .padding(.top, 6.0)

                Text("在\(data.event)上花了\(amountFormatted)元")
                    .font(.title2)
                    .padding(.vertical, 9.0)

                Text(text)
                    .font(.body)

                HStack(alignment: .center) {
                    if let rating = data.story?.rating {
                        RatingView(rating: rating)
                    }

                    Spacer()

                    if let emoji = data.story?.emoji {
                        Text(emoji)
                            .font(.title)
                    }
                }
            }
            .padding(.all, 10)
        }
    }
}

// struct ItemStoryView_Previews: PreviewProvider {
//    @StateObject static var PreviewAccountBook = AccountBookModel()
//
//    static var previews: some View {
//        ItemStoryView(item: PreviewAccountBook.wholeEx.items[164])
//
//        StoryTab()
//            .environmentObject(PreviewAccountBook)
//    }
// }

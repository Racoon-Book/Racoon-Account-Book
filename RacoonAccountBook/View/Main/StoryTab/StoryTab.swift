//
//  StoryTab.swift
//  RacoonAccountBook
//
//  Created by 杨希杰 on 2021/7/19.
//

import SwiftUI

struct StoryTab: View {
    @ObservedObject var RacoonAccountBook: AccountBookModel // FIXME: 这里应该用绑定的

    var body: some View {
        Text("StoryTab")
    }
}

struct StoryTab_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        StoryTab(RacoonAccountBook: PreviewAccountBook)
    }
}

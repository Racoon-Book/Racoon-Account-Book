////
////  FocusPieChartView.swift
////  RacoonAccountBook
////
////  Created by c0per chen on 7/29/21.
////
//
//import SwiftUI
//import SwiftUICharts
//
//struct FocusPieChartView: View {
//    @EnvironmentObject var RacoonAccountBook: AccountBookModel
//    
//    let focusList = AccountBook.focusList
//    
//    var body: some View {
//        let data = focusList.map { Double(RacoonAccountBook.GetBookOfThisMonthOfTag(tag: $0).exSum) }
//        
//        PieChartView (data: data, title: "关注的标签", form: ChartForm.large, dropShadow: false)
//    }
//}

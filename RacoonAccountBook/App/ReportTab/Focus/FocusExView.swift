////
////  FocusExView.swift
////  RacoonAccountBook
////
////  Created by c0per chen on 7/29/21.
////
//
//import SwiftUI
//import SwiftDate
//
//// TODO: 现在默认显示本月信息
//struct FocusExView: View {
//    @EnvironmentObject var RacoonAccountBook: AccountBookModel
//    
//    let focusList = AccountBook.focusList
//
//    var body: some View {
//        ZStack(alignment: .leading) {
//            RoundedRectangle(cornerRadius: 15)
//                .foregroundColor(Color("ReportBG"))
//            
//            VStack(alignment: .leading) {
//                Text("关注的支出")
//                
//                HStack {
//                    VStack(alignment: .leading) {
//                        Text("标签").font(.footnote)
//                        ForEach(focusList, id: \.self) { tag in
//                            Text(tag)
//                                .padding(.vertical, 0.3)
//                        }
//                    }
//                    
//                    Spacer()
//                    
//                    VStack(alignment: .leading) {
//                        Text("本月支出").font(.footnote)
//                        ForEach(focusList, id: \.self) { tag in
//                            let TagBook = RacoonAccountBook.GetBookOfThisMonthOfTag(tag: tag)
//                            let ExTag = String(format: "%.1f", TagBook.exSum)
//                            
//                            Text(ExTag)
//                                .padding(.vertical, 0.3)
//                        }
//                    }
//                }
//                .padding(.horizontal, 10.0)
//                .padding(.vertical, 4.0)
//            }
//            .padding()
//        }
//    }
//}

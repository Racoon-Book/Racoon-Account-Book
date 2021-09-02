//import SwiftDate
//import SwiftUI
//
//struct DayCounterView: View {
//    @Environment(\.managedObjectContext) var context
//    
//    var expenses: [Expense]
//
//    var body: some View {
//        let days = expenses.days()
//        let dayCount = Expense.continous_days(context: context).count
//        let storyCount = expenses.story_only().count
//        
//        ZStack(alignment: .leading) {
//            RoundedRectangle(cornerRadius: 15)
//                .foregroundColor(Color("ReportBG"))
//            
//            VStack(alignment: .leading) {
//                Text("习惯养成")
//                
//                HStack {
//                    VStack(alignment: .leading) {
//                        Text("记账天数").font(.callout)
//                        Text(String(days.count)).font(.title)
//                    }
//                    
//                    Spacer()
//                    
//                    VStack(alignment: .leading) {
//                        Text("连续记账天数").font(.callout)
//                        Text(String(dayCount)).font(.title)
//                    }
//                    
//                    Spacer()
//                    
//                    VStack(alignment: .leading) {
//                        Text("财记条数").font(.callout)
//                        Text(String(storyCount)).font(.title)
//                    }
//                }
//                .padding(.horizontal, 10.0)
//                .padding(.vertical, 7.0)
//            }
//            .padding()
//        }
//    }
//}

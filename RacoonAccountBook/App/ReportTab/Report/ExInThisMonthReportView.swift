import CoreData
import SwiftDate
import SwiftUI

struct ExInThisMonthReportView: View {
    var expenseSumInThisMonth: Float
    var expenseCountInThisMonth: Int
    var maxExpense: Expense?
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("ReportBG"))
            
            VStack(alignment: .leading) {
                Text("支出")
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("本月支出")
                            .font(.callout)
                        Text(String(expenseSumInThisMonth))
                            .font(.title)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        let expenseAvgInThisMonth = String(format: "%.1f", expenseSumInThisMonth / Float(DateInRegion(region: regionChina).day))
                        
                        Text("日均支出(\(DateInRegion(region: regionChina).day)天)")
                            .font(.callout)
                        Text(expenseAvgInThisMonth)
                            .font(.title)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("支出笔数").font(.callout)
                        Text(String(expenseCountInThisMonth))
                            .font(.title)
                    }
                }
                .padding(.horizontal, 10.0)
                .padding(.vertical, 4.0)
                
                HStack {
                    if let maxExpense = maxExpense, maxExpense.amount != 0.0 {
                        let max_amount = String(format: "%.1f", maxExpense.amount)

                        VStack(alignment: .leading) {
                            Text("最高支出").font(.callout)
                            Text(max_amount).font(.title)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text(DisplayDate(maxExpense.spentAt))
                            Text(maxExpense.event).font(.callout)
                        }
                        
                        Spacer()
                    } else {
                        EmptyView()
                    }
                }
                .padding(.horizontal, 10.0)
            }
            .padding()
        }
    }
}

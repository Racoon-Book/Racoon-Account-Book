import SwiftDate
import SwiftUI

struct ExView: View {
    var expenses: [Expense]
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("ReportBG"))
            
            VStack(alignment: .leading) {
                Text("支出")
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("本月支出").font(.callout)
                        Text(String(expenses.sum())).font(.title)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        let ExAvg = String(format: "%.1f", expenses.sum() / Float(DateInRegion(region: regionChina).day))
                        
                        Text("日均支出").font(.callout)
                        Text(ExAvg).font(.title)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("支出笔数").font(.callout)
                        Text(String(expenses.count)).font(.title)
                    }
                }
                .padding(.horizontal, 10.0)
                .padding(.vertical, 4.0)
                
                HStack {
                    let max_amount = String(format: "%.1f", expenses.max_amount() ?? 0.0)
                    let max_expense = expenses.max_expense()
                    
                    Text("最高支出").font(.callout)
                    Text(max_amount).font(.title)
                    Spacer()
                    Text(DisplayDate(max_expense?.spentAt ?? DateInRegion("1970-01-01 00:00:00", region: regionChina)!))
                    Text(max_expense?.event ?? "花销").font(.callout)
                }
                .padding(.horizontal, 10.0)
            }
            .padding()
        }
    }
}

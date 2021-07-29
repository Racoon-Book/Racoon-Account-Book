//
//  ExView.swift
//  RacoonAccountBook
//
//  Created by c0per chen on 7/29/21.
//

import SwiftUI
import SwiftDate

struct ExView: View {
    var monthBook: PeriodicEx
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("ReportBG"))
            
            VStack(alignment: .leading) {
                Text("支出")
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("本月支出").font(.callout)
                        Text(String(monthBook.exSum)).font(.title)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        let ExAvg = String(format: "%.1f", monthBook.exSum / Float(DateInRegion(region: regionChina).day))
                        
                        Text("日均支出").font(.callout)
                        Text(ExAvg).font(.title)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("支出笔数").font(.callout)
                        Text(String(monthBook.exCounter)).font(.title)
                    }
                }
                .padding(.horizontal, 10.0)
                .padding(.vertical, 4.0)
                
                HStack {
                    let ExHigh = String(format: "%.1f", monthBook.exHighest)
                    let HighItem = monthBook.items.max { $0.metadata.amount_float < $1.metadata.amount_float }
                    
                    Text("最高支出").font(.callout)
                    Text(ExHigh).font(.title)
                    Spacer()
                    Text(DisplayDate(HighItem?.metadata.spentMoneyAt ?? DateInRegion(region: regionChina)))
                    Text(HighItem?.metadata.event ?? "花销").font(.callout)
                }
                .padding(.horizontal, 10.0)
            }
            .padding()
        }
    }
}

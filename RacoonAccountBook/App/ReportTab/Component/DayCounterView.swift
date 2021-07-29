//
//  DayCounterView.swift
//  RacoonAccountBook
//
//  Created by c0per chen on 7/29/21.
//

import SwiftUI
import SwiftDate

struct DayCounterView: View {
    var monthBook: PeriodicEx
    
    var body: some View {
        let days = GetDays()
        let dayCount = GetContinuousDayCount(days)
        let storyCount = monthBook.items.filter { $0.metadata.story != nil }.count
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("ReportBG"))
            
            VStack(alignment: .leading) {
                Text("习惯养成")
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("记账天数").font(.callout)
                        Text(String(days.count)).font(.title)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("连续记账天数").font(.callout)
                        Text(String(dayCount)).font(.title)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("财记条数").font(.callout)
                        Text(String(storyCount)).font(.title)
                    }
                }
                .padding(.horizontal, 10.0)
                .padding(.vertical, 7.0)
            }
            .padding()
        }
    }
    
    // 获得不重复的记账日
    func GetDays() -> [Int] {
        let rawDays = monthBook.items.map { $0.metadata.spentMoneyAt.day }
            .sorted()
        
        // 去重
        var re = [Int]()
        for (index, day) in rawDays.enumerated() {
            if index == 0 || day != rawDays[index - 1] {
                re.append(day)
            }
        }
        
        return re
    }
    
    // 获得从今天开始的连续记账天数
    func GetContinuousDayCount(_ rawDays: [Int]) -> Int {
        let days = rawDays.sorted(by: >)
        // 今天没有记账
        if days.first != DateInRegion(region: regionChina).day {
            return 0
        } else {
            for (index, day) in days.enumerated() {
                if index > 0 && day < days[index - 1] - 1 {
                    return index
                }
            }
        }
        // 记账未中断
        return days.count
    }
}

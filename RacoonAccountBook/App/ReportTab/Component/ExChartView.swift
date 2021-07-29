//
//  ExChartView.swift
//  RacoonAccountBook
//
//  Created by c0per chen on 7/29/21.
//

import SwiftUI
import SwiftUICharts

struct ExChartView: View {
    var monthBook: PeriodicEx
    
    var body: some View {
        let data = monthBook.items.map { Double($0.metadata.amount_float) }
        LineChartView (data: data, title: "本月支出", form: ChartForm.large, rateValue: nil, dropShadow: false)
    }
}

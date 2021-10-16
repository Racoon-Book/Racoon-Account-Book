// FocusChartView.swift

import SwiftUI
import SwiftUICharts

struct FocusChartView: View {
    // TODO
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]

    var body: some View {
        PieChart()
            .data(demoData)
            .chartStyle(ChartStyle(backgroundColor: .white,
                                   foregroundColor: ColorGradient(.blue, .purple)))
            .frame(width: 300, height: 400, alignment: .center)
    }
}

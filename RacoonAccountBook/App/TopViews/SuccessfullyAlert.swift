// SuccessfullyAlert.swift

import Foundation
import SwiftUI

struct SuccessfullyAlert: View {
    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel

    @Binding var showAddSuccessfullyAlert: Bool
    var metadata: MetaItem
    var body: some View {
        VStack {
            Text(RacoonSheetConfig.shared.isEditMode ? "已更新账本！" : "已添加账目！")
                .foregroundColor(.black)
                .font(.system(.title))
                .padding([.horizontal, .top])

            // FIXME: 改好MetaItemView的init之后来改这个
            MetaItemView(metadata: metadata)

                .padding()
        }
        .frame(width: UIScreen.main.bounds.width - 100)
        .background(Color("alert.background").opacity(0.95))
        .cornerRadius(12)
        .clipped()
        .padding() // 和右边离远一点
        .onAppear {
            // 过一段时间自行消失
            let appearingTimeInterval: TimeInterval = 3 // seconds
            Timer.scheduledTimer(withTimeInterval: appearingTimeInterval, repeats: false) { _ in
                withAnimation(.easeInOut) {
                    showAddSuccessfullyAlert = false
                }
            }
        }
    }
}

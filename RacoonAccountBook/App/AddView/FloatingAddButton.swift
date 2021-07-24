import Foundation
import SwiftUI

struct FloatingAddButton: View {
    let addButtonSize = CGFloat(50)

    @Binding var addUIConfig: AddUIConfig

    var body: some View {
        HStack {
            // 用Spacer()将加好怼到最右边
            Spacer()
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: addButtonSize, height: addButtonSize)
                    Button(action: {}, label: {
                        Text(Image(systemName: "plus"))
                            .foregroundColor(.black)
                            .bold()
                            .font(.system(size: addButtonSize * 0.75))
                            .onTapGesture {
                                // 点击弹出一般添加界面
                                print("[FloatingAddButton] Tapped")
                                addUIConfig.isShowingOrdinaryAddView.toggle()
                            }
                            .onLongPressGesture {
                                // 长按弹出语音界面
                                print("[FloatingAddButton] LongPressed")
                                addUIConfig.isShowingVoiceInputView.toggle()
                            } // 注意onTapGesture在前onLongPressGesture在后
                    })
                }
                .padding([.horizontal], 25) // 远离右边
                .padding([.vertical], 80) // 远离下边 因为有安全区，所以这个值比右边大一些
            }
        }
    }
}

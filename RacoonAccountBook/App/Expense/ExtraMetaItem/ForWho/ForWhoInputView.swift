import SwiftDate
import SwiftUI

struct ForWhoInputView: View {
    @Binding var metadata_inputting: ExpenseInfo

    @Binding var showingForWhoInputView: Bool

    static let height = CGFloat(47)

    var body: some View {
        HStack {
            VStack {
                Text("为谁")
                    .font(.system(.headline))
                    .padding([.bottom], 1)

                // 关闭为谁的按钮
                Button(action: {
                    metadata_inputting.forWho = []
                    showingForWhoInputView = false
                }, label: {
                    Text(Image(systemName: "multiply.square"))
                        .font(.system(.headline))
                        .foregroundColor(.black)
                })
            }

            if metadata_inputting.forWho != [] {
                ForEach(metadata_inputting.forWho, id: \.self) { sb in
                    SingleSomebodyView(metadata_inputting: $metadata_inputting,
                                       sb: sb,
                                       isEditMode: true,
                                       color: Color.orange)
                }
                .padding([.leading], 4) // 和上下的对齐
            }

            ForWhoField(metadata_inputting: $metadata_inputting)

            Spacer()
        }
        .frame(height: ForWhoInputView.height)
        .padding([.vertical], 5) // 别和上下挨的太近
    }
}

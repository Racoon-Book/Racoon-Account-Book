import SwiftDate
import SwiftUI

// [用来显示一个条目的View]
struct MetaItemView: View {
    // TODO: 改为Binding
    var metadata: MetaItem
    // 条目是否能编辑
    var isEditable: Bool = true
    // 是否正在编辑BookTab的某个条目
    @State var isShowingEditSheet: Bool = false

    var body: some View {
        let amount_dispaly = String(format: "%.1f", metadata.amount_float)

        VStack(alignment: .leading) {
            HStack {
                // [event]
                if metadata.event != "" {
                    Text(metadata.event)
                        .bold()
                        .font(.title2)
                        .foregroundColor(.primary)
                } else {
                    Text("请记录你的花销")
                        .bold()
                        .font(.title3)
                        .foregroundColor(.secondary)
                }

                // [story icon]
                if metadata.story != nil {
                    Text(Image(systemName: "bookmark.fill"))
                        .foregroundColor(Color.blue)
                }

                Spacer()

                // [amount]
                Text(amount_dispaly)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.black)
            }

            // [tags]
            // TODO: 这里用MultilineTagsViewForScrollView界面会出问题，反正也不会添加很多标签，一行就够了；但是输入那块地方不够还是的多行
            if metadata.tags != [] {
                HStack {
                    ForEach(metadata.tags, id: \.self) { tag in
                        SingleComponentView(
                            text: tag,
                            color: Color("Add-Tag")
                        )
                    }
                }
            }

            // [focus] & [forWho]
            HStack {
                if let focus = metadata.focus {
                    SingleComponentView(text: focus, color: Color("focus"))
                }

                if metadata.forWho != [] {
                    ForEach(metadata.forWho, id: \.self) { sb in
                        SingleComponentView(
                            text: sb,
                            color: Color.orange
                        )
                    }
                }
            }
        }
        .onTapGesture {
            if isEditable {
                isShowingEditSheet = true
            }
        }
        .sheet(
            // 点击FloatingAddButton会弹出sheet让用户添加；语音输入结束该页面也会弹出
            isPresented: $isShowingEditSheet,
            onDismiss: didDismissEditingMetaItemSheet
        ) {
//            OrdinaryAddSheet(
//                isEditingMetaItem: true, // 开的是修改页面
//                addUIConfig: .constant(AddUIConfig()), // 传默认值
//                metadata_inputting: $RacoonAccountBook.wholeBook.items.,
//                amount_string_inputting: $amount_string_inputting,
//                showAddSuccessfullyAlert: $showAddSuccessfullyAlert
//            )
            Text("haha")
        }
    }

    private func didDismissEditingMetaItemSheet() {
        isShowingEditSheet = false // 应该不用这一句 系统dismiss的时候应该会将该变量设置为false

        // 正在编辑的sheet下来之后什么都不用做…就当用户取消了刚刚修改的内容。
        // TODO: 可能需要将页面的状态复原
        printLog("[MetaItemView] didDismissEditingMetaItemSheet()")
    }
}

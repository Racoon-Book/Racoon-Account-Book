import SwiftDate
import SwiftUI

// 用来显示一个条目的View
struct MetaItemView: View {
    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel

    // MARK: - 基础数据

    /// 该View呈现的MetaItem
    var metadata: MetaItem

    // MARK: - 修改相关

    /// 条目是否能编辑
    var isEditable: Bool = true

    /// 要修改的Item的id
    var itemId: Int = 0

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
        // 点击Item弹出Sheet对MetaItem进行修改
        // 修改的逻辑是这样的：有一个真实的在数据库中的值，将该值拷贝一份放入新创建的metadata_inputting，这样打开Sheet就会显示修改前的值；这个值是一个临时的变量，在Sheet中修改不会直接影响到该变量；只有当最后点击`修改`按钮的时候才会对数据库中的真实值进行修改
        .onTapGesture {
            // 是修改模式才判断点击
            if isEditable {
                // 配置Sheet
                RacoonSheetConfig.shared.isEditMode = true
                RacoonSheetConfig.shared.itemIdToEdit = itemId
                // 传过去的临时修改值
                RacoonSheetConfig.shared.metadata_inputting = metadata

                // 展示Sheet
                RacoonSheetConfig.shared.showingOrdinaryAddView = true
            }
        }
    }

    private func didDismissEditingMetaItemSheet() {
        printLog("[MetaItemView] didDismissEditingMetaItemSheet()")
    }
}

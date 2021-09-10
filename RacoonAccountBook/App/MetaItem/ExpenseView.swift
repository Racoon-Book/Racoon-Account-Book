import SwiftDate
import SwiftUI

// 用来显示一个条目的View
struct ExpenseView: View {
    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel

    // MARK: - 基础数据

    /// 该View呈现的MetaItem
    var expenseInfo: ExpenseInfo

    // MARK: - 修改相关

    /// 条目是否能编辑
    var isEditable: Bool = true

    /// 要修改的Item的id
    var uuidOfItemToEdit: UUID? = nil

    var body: some View {
        let amount_dispaly = String(format: "%.1f", expenseInfo.amount)

        VStack(alignment: .leading) {
            HStack {
                // [event]
                if expenseInfo.event != "" {
                    Text(expenseInfo.event)
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
                if expenseInfo.story != nil {
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
            if expenseInfo.tags != [] {
                HStack {
                    MultilineTagsForDisplay(
                        tags: expenseInfo.tags.sorted(),
                        color: Color("Add-Tag")
                    )
                }
            }

            // [focus] & [forWho]
            HStack {
                if let focus = expenseInfo.focus {
                    SingleComponentView(text: focus, color: Color("focus"))
                }

                if expenseInfo.forWho != [] {
                    MultilineTagsForDisplay(
                        tags: expenseInfo.forWho.sorted(),
                        color: Color.orange
                    )
                }
            }
        }
        // 点击Item弹出Sheet对MetaItem进行修改
        // 修改的逻辑是这样的：有一个真实的在数据库中的值，将该值拷贝一份放入新创建的metadata_inputting，这样打开Sheet就会显示修改前的值；这个值是一个临时的变量，在Sheet中修改不会直接影响到该变量；只有当最后点击`修改`按钮的时候才会对数据库中的真实值进行修改
        .onTapGesture {
            // 是修改模式才判断点击
            if isEditable {
                // 这里的感叹号是因为修改的话必须传入确切的UUID
                RacoonSheetConfig.showEditSheet(itemIdToEdit: uuidOfItemToEdit!, metadata: expenseInfo)
            }
        }
    }

    private func didDismissEditingMetaItemSheet() {
        print(Log().string)
    }
}

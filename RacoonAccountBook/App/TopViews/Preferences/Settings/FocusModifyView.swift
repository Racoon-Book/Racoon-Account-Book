import SwiftUI

struct FocusModifyView: View {
    @Environment(\.managedObjectContext) private var context

    @FetchRequest(fetchRequest: Focus.request_allFocus)
    var allFocus

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("关注")
                    .font(.system(.headline))

                FocusField(hint: "添加新关注")
                    .padding([.vertical], 5) // 不和下面的挨太近
            }

            MultilineFocusViewForModify(color: defaultColorSet.capsule.focus)

            Spacer()
        }
        .padding() // 别碰到屏幕边儿上
    }
}

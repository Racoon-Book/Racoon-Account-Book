// Check https://stackoverflow.com/a/62103264
// 能够让 小的SingleTagView 自动换行

import SwiftUI

struct MultilineTagsViewForModify: View {
    @Binding var tags: [String] // 点击x号需要在tags中删除tag
    @Binding var expenseInfo_inputting: ExpenseInfo

    var isEditMode: Bool // 是的话会显示x号
    var isSuggestion: Bool = false
    var color: Color

    static let oneLineTagHeight = CGFloat(30)

    @State private var totalHeight
        = CGFloat.zero // << variant for ScrollView/List
//        = CGFloat.infinity // << variant for VStack

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight) // << variant for ScrollView/List
        .frame(
            minHeight: tags == [] ? 0 : MultilineTagsViewForModify.oneLineTagHeight,
            maxHeight: max(totalHeight, MultilineTagsViewForModify.oneLineTagHeight)
        ) // << variant for VStack
        // 这里以一行的tag为基准 确保tag不会出现被挤没的情况
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                self.item(for: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if abs(width - d.width) > g.size.width {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0 // last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for tag: String) -> some View {
        SingleTagViewForModify(expenseInfo_inputting: $expenseInfo_inputting, tag: tag, isEditMode: isEditMode, isSuggestedTag: isSuggestion, color: color)
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

// example:
// struct TestTagCloudView: View {
//    var body: some View {
//        VStack {
//            Text("Header").font(.largeTitle)
//            TagCloudView(tags: ["Ninetendo", "XBox", "PlayStation", "PlayStation 2", "PlayStation 3", "PlayStation 4"])
//            Text("Some other text")
//            Divider()
//            Text("Some other cloud")
//            TagCloudView(tags: ["Apple", "Google", "Amazon", "Microsoft", "Oracle", "Facebook"])
//        }
//    }
// }

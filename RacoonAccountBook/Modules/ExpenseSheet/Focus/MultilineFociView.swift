import SwiftUI

struct MultilineFociView: View {
    @Binding var foci: [String]
    @Binding var expenseInfo_inputting: ExpenseInfo

    var selectedColor: Color
    var unselectedColor: Color

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
//        .frame(
//            minHeight: foci == [] ? 0 : MultilineTagsViewForVStack.oneLineTagHeight,
//            maxHeight: max(totalHeight, MultilineTagsViewForVStack.oneLineTagHeight)) // << variant for VStack
        // 这里以一行的tag为基准 确保tag不会出现被挤没的情况
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.foci, id: \.self) { tag in
                self.item(for: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if abs(width - d.width) > g.size.width {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.foci.last! {
                            width = 0 // last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if tag == self.foci.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for focus: String) -> some View {
        SingleFocusView(expenseInfo_inputting: $expenseInfo_inputting,
                        focus: focus,
                        selectedColor: selectedColor,
                        unselectedColor: unselectedColor)
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

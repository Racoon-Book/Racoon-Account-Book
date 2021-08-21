import SwiftUI

struct FocusSelectView: View {
    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel
    
    @Binding var metadata_inputting: MetaItem

    var body: some View {
        HStack {
            Text("关注")
                .font(.system(.headline))
            VStack(alignment: .leading) {
                MultilineFociView(
                    foci: .constant(AccountBook.focusList),
                    metadata_inputting: $metadata_inputting,
                    selectedColor: Color("focus"),
                    unselectedColor: Color("focus-unselected")
                )
            }
        }
    }
}

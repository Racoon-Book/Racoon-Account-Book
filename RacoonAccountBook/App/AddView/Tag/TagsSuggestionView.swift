import SwiftUI

struct TagsSuggestionView: View {
    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel
    
    @Binding var metadata_inputting: MetaItem

    var body: some View {
        HStack {
            if metadata_inputting.generatedTags != [] {
                Text("建议")
                    .font(.system(.headline))
                VStack(alignment: .leading) {
                    MultilineTagsViewForVStack(
                        tags: $metadata_inputting.generatedTags,
                        metadata_inputting: $metadata_inputting,
                        isEditMode: false,
                        isSuggestion: true,
                        color: Color("AntiqueWhite")
                    )
                }
            } else {
                EmptyView()
            }
        }
    }
}

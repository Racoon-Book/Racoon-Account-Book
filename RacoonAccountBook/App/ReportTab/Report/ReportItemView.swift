import SwiftUI

struct ReportItemView: View {
    var reportTitle: String
    var reportBody: String
    var reportTintColor: Color = .blue
    var reportNote: String?

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(reportTitle)")
                .font(.system(.title2))
                .foregroundColor(reportTintColor)
            Text("\(reportBody)")
                .font(.system(.title, design: .rounded))
                .bold()
                .foregroundColor(reportTintColor)
            if let note = reportNote {
                Text("\"\(note)\"")
                    .font(.system(.body))
                    .foregroundColor(.secondary)
            }
        }
    }
}

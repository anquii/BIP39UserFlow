import SwiftUI

struct PrimaryButtonView: View {
    private let text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .font(.body)
            .fontWeight(.medium)
            .fontDesign(.rounded)
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .buttonStyle(.plain)
    }
}

import SwiftUI

struct BodyText: View {
    private let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .font(.body)
            .fontWeight(.regular)
            .fontDesign(.rounded)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.leading)
    }
}

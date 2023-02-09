import SwiftUI

struct HeadlineText: View {
    private let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.leading)
    }
}

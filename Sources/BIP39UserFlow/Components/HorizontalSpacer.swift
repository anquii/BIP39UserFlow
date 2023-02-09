import SwiftUI

struct HorizontalSpacer: View {
    private let width: CGFloat

    init(width: CGFloat) {
        self.width = width
    }

    var body: some View {
        Spacer()
            .frame(width: width)
    }
}

import SwiftUI

struct VerticalSpacer: View {
    private let height: CGFloat

    init(height: CGFloat) {
        self.height = height
    }

    var body: some View {
        Spacer()
            .frame(height: height)
    }
}

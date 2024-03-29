import SwiftUI

struct LazyView<Content: View>: View {
    private let content: () -> Content

    init(_ content: @autoclosure @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        content()
    }
}

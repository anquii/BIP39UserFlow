import SwiftUI

struct WireframeConnection<Content: View> {
    let isPresented: Binding<Bool>?
    let content: () -> Content

    init(isPresented: Binding<Bool>? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.isPresented = isPresented
        self.content = content
    }
}

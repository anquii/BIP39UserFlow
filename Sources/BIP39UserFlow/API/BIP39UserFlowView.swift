import SwiftUI
import UIKit

struct BIP39UserFlowView: View {
    @Environment(\.colorScheme) private var colorScheme

    @State var model: BIP39UserFlowViewModel

    var body: some View {
        NavigationStack {
            model.wireframeContent.view()
        }
        .environment(\.colorTheme, model.colorThemeProvider.colorTheme(scheme: colorScheme))
        .environment(\.hasBottomSafeAreaInsets, UIApplication.shared.hasBottomSafeAreaInsets)
        .onAppear {
            model.onAppear()
        }
    }
}

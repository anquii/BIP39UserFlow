import SwiftUI

struct WireframeContent {
    private let component: WireframeComponent

    init(component: WireframeComponent) {
        self.component = component
    }
}

// MARK: - API
extension WireframeContent {
    @ViewBuilder func view() -> some View {
        view(component: component)
    }

    @ViewBuilder func view<Content: View>(connection: WireframeConnection<Content>) -> some View {
        let lazyView = LazyView(view())
        switch transition(component: component) {
        case .horizontal:
            NavigationLink(destination: lazyView) {
                connection.content()
            }
        case .vertical:
            Button(action: {
                connection.isPresented!.wrappedValue.toggle()
            }) {
                connection.content()
            }.sheet(isPresented: connection.isPresented!) {
                lazyView
            }
        }
    }
}

// MARK: - Helpers
fileprivate extension WireframeContent {
    @ViewBuilder func view(component: WireframeComponent) -> some View {
        switch component {
        case .confirmMnemonic:
            ConfirmMnemonicViewConstructor.view()
        case .createMnemonic:
            CreateMnemonicViewConstructor.view()
        case .createMnemonicPassphrase:
            CreateMnemonicPassphraseViewConstructor.view()
        case .importMnemonic:
            ImportMnemonicViewConstructor.view()
        case .importMnemonicPassphrase:
            ImportMnemonicPassphraseViewConstructor.view()
        case .nameWallet:
            NameWalletViewConstructor.view()
        case .selectMnemonicEntropySecurity:
            SelectMnemonicEntropySecurityViewConstructor.view()
        case .selectMnemonicOption:
            SelectMnemonicOptionViewConstructor.view()
        }
    }

    func transition(component: WireframeComponent) -> WireframeTransition {
        .horizontal
    }
}

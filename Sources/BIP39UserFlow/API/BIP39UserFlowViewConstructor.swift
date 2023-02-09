import SwiftUI

public struct BIP39UserFlowViewConstructor {
    private let configuration: BIP39UserFlowConfigurable

    public init(configuration: BIP39UserFlowConfigurable) {
        guard 3...24 ~= configuration.mnemonicConfiguration.requiredConfirmedWordCount else {
            preconditionFailure()
        }
        self.configuration = configuration
    }

    public func view() -> some View {
        let repository = InMemoryRepository(storage: InMemoryStorage.shared)
        let viewModel = BIP39UserFlowViewModel(configuration: configuration, repository: repository)
        let view = BIP39UserFlowView(model: viewModel)
        return view
    }
}

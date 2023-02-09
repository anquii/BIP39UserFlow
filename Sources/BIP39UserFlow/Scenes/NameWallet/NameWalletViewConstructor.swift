import BIP39
import SwiftUI

struct NameWalletViewConstructor {
    static func view() -> some View {
        let repository = InMemoryRepository(storage: InMemoryStorage.shared)
        let content = NameWalletContent(localizationConfiguration: repository.localizationConfiguration)
        let seedDerivator = SeedDerivator()
        let createWalletInteractor = CreateWalletInteractor(repository: repository, seedDerivator: seedDerivator)
        let viewModel = NameWalletViewModel(content: content, createWalletInteractor: createWalletInteractor)
        let view = NameWalletView(model: viewModel)
        return view
    }
}

import SwiftUI

struct CreateMnemonicPassphraseViewConstructor {
    static func view() -> some View {
        let repository = InMemoryRepository(storage: InMemoryStorage.shared)
        let content = CreateMnemonicPassphraseContent(localizationConfiguration: repository.localizationConfiguration)
        let viewModel = CreateMnemonicPassphraseViewModel(content: content, repository: repository)
        let view = CreateMnemonicPassphraseView(model: viewModel)
        return view
    }
}

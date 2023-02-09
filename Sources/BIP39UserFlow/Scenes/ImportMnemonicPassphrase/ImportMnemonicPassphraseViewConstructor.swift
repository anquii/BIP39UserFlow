import SwiftUI

struct ImportMnemonicPassphraseViewConstructor {
    static func view() -> some View {
        let repository = InMemoryRepository(storage: InMemoryStorage.shared)
        let content = ImportMnemonicPassphraseContent(localizationConfiguration: repository.localizationConfiguration)
        let viewModel = ImportMnemonicPassphraseViewModel(content: content, repository: repository)
        let view = ImportMnemonicPassphraseView(model: viewModel)
        return view
    }
}

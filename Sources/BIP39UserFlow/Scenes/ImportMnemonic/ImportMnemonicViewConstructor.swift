import SwiftUI

struct ImportMnemonicViewConstructor {
    static func view() -> some View {
        let repository = InMemoryRepository(storage: InMemoryStorage.shared)
        let content = ImportMnemonicContent(localizationConfiguration: repository.localizationConfiguration)
        let viewModel = ImportMnemonicViewModel(content: content, repository: repository)
        let view = ImportMnemonicView(model: viewModel)
        return view
    }
}

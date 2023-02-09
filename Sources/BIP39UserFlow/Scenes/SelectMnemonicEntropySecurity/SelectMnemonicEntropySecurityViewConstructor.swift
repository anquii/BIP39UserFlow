import SwiftUI

struct SelectMnemonicEntropySecurityViewConstructor {
    static func view() -> some View {
        let repository = InMemoryRepository(storage: InMemoryStorage.shared)
        let content = SelectMnemonicEntropySecurityContent(localizationConfiguration: repository.localizationConfiguration)
        let viewModel = SelectMnemonicEntropySecurityViewModel(content: content, repository: repository)
        let view = SelectMnemonicEntropySecurityView(model: viewModel)
        return view
    }
}

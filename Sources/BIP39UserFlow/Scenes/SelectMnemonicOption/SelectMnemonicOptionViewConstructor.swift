import SwiftUI

struct SelectMnemonicOptionViewConstructor {
    static func view() -> some View {
        let repository = InMemoryRepository(storage: InMemoryStorage.shared)
        let content = SelectMnemonicOptionContent(localizationConfiguration: repository.localizationConfiguration)
        let viewModel = SelectMnemonicOptionViewModel(content: content, repository: repository)
        let view = SelectMnemonicOptionView(model: viewModel)
        return view
    }
}

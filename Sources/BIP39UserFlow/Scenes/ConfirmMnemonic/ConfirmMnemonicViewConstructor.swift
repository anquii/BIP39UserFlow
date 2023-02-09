import SwiftUI

struct ConfirmMnemonicViewConstructor {
    static func view() -> some View {
        let repository = InMemoryRepository(storage: InMemoryStorage.shared)
        let content = ConfirmMnemonicContent(localizationConfiguration: repository.localizationConfiguration)
        let mnemonicWordsInteractor = MnemonicWordsInteractor(repository: repository)
        let viewModel = ConfirmMnemonicViewModel(
            content: content,
            repository: repository,
            mnemonicWordsInteractor: mnemonicWordsInteractor
        )
        let view = ConfirmMnemonicView(model: viewModel)
        return view
    }
}

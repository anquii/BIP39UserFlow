import BIP39
import SwiftUI

struct CreateMnemonicViewConstructor {
    static func view() -> some View {
        let repository = InMemoryRepository(storage: InMemoryStorage.shared)
        let content = CreateMnemonicContent(localizationConfiguration: repository.localizationConfiguration)
        let entropyGenerator = EntropyGenerator()
        let mnemonicConstructor = MnemonicConstructor()
        let interactor = CreateMnemonicInteractor(
            repository: repository,
            entropyGenerator: entropyGenerator,
            constructor: mnemonicConstructor
        )
        let mnemonicWordsInteractor = MnemonicWordsInteractor(repository: repository)
        let viewModel = CreateMnemonicViewModel(
            content: content,
            repository: repository,
            interactor: interactor,
            mnemonicWordsInteractor: mnemonicWordsInteractor
        )
        let view = CreateMnemonicView(model: viewModel)
        return view
    }
}

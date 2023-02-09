struct CreateMnemonicPassphraseViewModel {
    let content: CreateMnemonicPassphraseContent
    private let repository: MnemonicPassphraseWriting

    init(content: CreateMnemonicPassphraseContent, repository: MnemonicPassphraseWriting) {
        self.content = content
        self.repository = repository
    }
}

extension CreateMnemonicPassphraseViewModel {
    var primaryCTAWireframeContent: WireframeContent {
        .init(component: .nameWallet)
    }

    func textDidChange(_ text: String) {
        repository.setMnemonicPassphrase(text)
    }

    func onPrimaryCTATapped(isTextEmpty: Bool) {
        if isTextEmpty {
            repository.setMnemonicPassphrase("")
        }
    }
}

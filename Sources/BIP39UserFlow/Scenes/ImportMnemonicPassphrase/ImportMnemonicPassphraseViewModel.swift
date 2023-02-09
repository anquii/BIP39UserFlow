struct ImportMnemonicPassphraseViewModel {
    let content: ImportMnemonicPassphraseContent
    private let repository: MnemonicPassphraseWriting

    init(content: ImportMnemonicPassphraseContent, repository: MnemonicPassphraseWriting) {
        self.content = content
        self.repository = repository
    }
}

extension ImportMnemonicPassphraseViewModel {
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

struct ImportMnemonicViewModel {
    let content: ImportMnemonicContent
    private let repository: MnemonicConfigurationReading & MnemonicWriting

    init(content: ImportMnemonicContent, repository: MnemonicConfigurationReading & MnemonicWriting) {
        self.content = content
        self.repository = repository
    }
}

extension ImportMnemonicViewModel {
    var primaryCTAWireframeContent: WireframeContent {
        if repository.mnemonicConfiguration.supportPassphrase {
            return .init(component: .importMnemonicPassphrase)
        } else {
            return .init(component: .nameWallet)
        }
    }

    func textDidChange(_ text: String) {
        repository.setMnemonic(text)
    }
}

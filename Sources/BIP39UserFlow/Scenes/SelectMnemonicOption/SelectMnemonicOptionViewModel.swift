struct SelectMnemonicOptionViewModel {
    let content: SelectMnemonicOptionContent
    private let repository: MnemonicConfigurationReading & MnemonicEntropySecurityWriting

    init(content: SelectMnemonicOptionContent, repository: MnemonicConfigurationReading & MnemonicEntropySecurityWriting) {
        self.content = content
        self.repository = repository
    }
}

extension SelectMnemonicOptionViewModel {
    var body: String {
        switch (showCreateMnemonicOption, showImportMnemonicOption) {
        case (true, true):
            return content.body
        case (true, false):
            return content.createMnemonicBody
        case (false, true):
            return content.importMnemonicBody
        default:
            preconditionFailure()
        }
    }

    var showCreateMnemonicOption: Bool {
        repository.mnemonicConfiguration.options.contains(.createMnemonic)
    }

    var showImportMnemonicOption: Bool {
        repository.mnemonicConfiguration.options.contains(.importMnemonic)
    }

    var createMnemonicWireframeContent: WireframeContent {
        if repository.mnemonicConfiguration.requireEntropySecuritySelection {
            return .init(component: .selectMnemonicEntropySecurity)
        } else {
            return .init(component: .createMnemonic)
        }
    }

    var importMnemonicWireframeContent: WireframeContent {
        .init(component: .importMnemonic)
    }

    func onCreateMnemonicOptionTapped() {
        repository.setMnemonicEntropySecurity(repository.mnemonicConfiguration.entropySecurity)
    }

    func onLeadingNavigationBarButtonTapped() {
        BIP39UserFlowPublishers.internalDismissPublisher.send()
    }
}

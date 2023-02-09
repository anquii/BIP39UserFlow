final class BIP39UserFlowViewModel {
    private let configuration: BIP39UserFlowConfigurable
    private let repository: LocalizationConfigurationWriting & MnemonicConfigurationWriting
    private(set) lazy var wireframeContent = WireframeContent(component: .selectMnemonicOption)

    init(configuration: BIP39UserFlowConfigurable, repository: LocalizationConfigurationWriting & MnemonicConfigurationWriting) {
        self.configuration = configuration
        self.repository = repository
    }
}

extension BIP39UserFlowViewModel {
    var colorThemeProvider: ColorThemeProviding {
        configuration.colorThemeProvider
    }

    func onAppear() {
        repository.setLocalizationConfiguration(configuration.localizationConfiguration)
        repository.setMnemonicConfiguration(configuration.mnemonicConfiguration)
    }
}

final class ConfirmMnemonicContent {
    private(set) lazy var title = "bip39UserFlow_confirmMnemonic_title".localized(configuration: localizationConfiguration)
    private(set) lazy var body = "bip39UserFlow_confirmMnemonic_body".localized(configuration: localizationConfiguration)
    private(set) lazy var mnemonicWord = "bip39UserFlow_confirmMnemonic_mnemonicWord".localized(configuration: localizationConfiguration)
    private(set) lazy var unselectedMnemonicWord = "bip39UserFlow_confirmMnemonic_unselectedMnemonicWord".localized(configuration: localizationConfiguration)
    private(set) lazy var primaryCTA = "bip39UserFlow_shared_primaryCTA_continue".localized(configuration: localizationConfiguration)

    func mnemonicWord(index: Int) -> String {
        "bip39UserFlow_confirmMnemonic_mnemonicWord".localized(configuration: localizationConfiguration, arguments: [index])
    }

    private let localizationConfiguration: LocalizationConfigurable

    init(localizationConfiguration: LocalizationConfigurable) {
        self.localizationConfiguration = localizationConfiguration
    }
}

final class ImportMnemonicPassphraseContent {
    private(set) lazy var title = "bip39UserFlow_importMnemonicPassphrase_title".localized(configuration: localizationConfiguration)
    private(set) lazy var body = "bip39UserFlow_importMnemonicPassphrase_body".localized(configuration: localizationConfiguration)
    private(set) lazy var placeholder = "bip39UserFlow_importMnemonicPassphrase_placeholder".localized(configuration: localizationConfiguration)
    private(set) lazy var continuePrimaryCTA = "bip39UserFlow_shared_primaryCTA_continue".localized(configuration: localizationConfiguration)
    private(set) lazy var skipPrimaryCTA = "bip39UserFlow_shared_primaryCTA_skip".localized(configuration: localizationConfiguration)

    private let localizationConfiguration: LocalizationConfigurable

    init(localizationConfiguration: LocalizationConfigurable) {
        self.localizationConfiguration = localizationConfiguration
    }
}

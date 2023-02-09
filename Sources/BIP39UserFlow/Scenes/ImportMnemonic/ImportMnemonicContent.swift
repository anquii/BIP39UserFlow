final class ImportMnemonicContent {
    private(set) lazy var title = "bip39UserFlow_importMnemonic_title".localized(configuration: localizationConfiguration)
    private(set) lazy var body = "bip39UserFlow_importMnemonic_body".localized(configuration: localizationConfiguration)
    private(set) lazy var placeholder = "bip39UserFlow_importMnemonic_placeholder".localized(configuration: localizationConfiguration)
    private(set) lazy var primaryCTA = "bip39UserFlow_shared_primaryCTA_continue".localized(configuration: localizationConfiguration)

    private let localizationConfiguration: LocalizationConfigurable

    init(localizationConfiguration: LocalizationConfigurable) {
        self.localizationConfiguration = localizationConfiguration
    }
}

final class NameWalletContent {
    private(set) lazy var title = "bip39UserFlow_nameWallet_title".localized(configuration: localizationConfiguration)
    private(set) lazy var body = "bip39UserFlow_nameWallet_body".localized(configuration: localizationConfiguration)
    private(set) lazy var placeholder = "bip39UserFlow_nameWallet_placeholder".localized(configuration: localizationConfiguration)
    private(set) lazy var primaryCTA = "bip39UserFlow_nameWallet_primaryCTA".localized(configuration: localizationConfiguration)

    private let localizationConfiguration: LocalizationConfigurable

    init(localizationConfiguration: LocalizationConfigurable) {
        self.localizationConfiguration = localizationConfiguration
    }
}

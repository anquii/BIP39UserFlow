final class CreateMnemonicContent {
    private(set) lazy var title = "bip39UserFlow_createMnemonic_title".localized(configuration: localizationConfiguration)
    private(set) lazy var primaryCTA = "bip39UserFlow_shared_primaryCTA_continue".localized(configuration: localizationConfiguration)

    func body(mnemonicWordCount: Int) -> String {
        "bip39UserFlow_createMnemonic_body".localized(configuration: localizationConfiguration, arguments: [mnemonicWordCount])
    }

    private let localizationConfiguration: LocalizationConfigurable

    init(localizationConfiguration: LocalizationConfigurable) {
        self.localizationConfiguration = localizationConfiguration
    }
}

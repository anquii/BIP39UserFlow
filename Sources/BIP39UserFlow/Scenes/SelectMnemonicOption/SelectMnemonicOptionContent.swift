final class SelectMnemonicOptionContent {
    private(set) lazy var title = "bip39UserFlow_selectMnemonicOption_title".localized(configuration: localizationConfiguration)
    private(set) lazy var body = "bip39UserFlow_selectMnemonicOption_body".localized(configuration: localizationConfiguration)
    private(set) lazy var createMnemonicBody = "bip39UserFlow_selectMnemonicOption_createMnemonic_body"
        .localized(configuration: localizationConfiguration)
    private(set) lazy var createMnemonicHeadline = "bip39UserFlow_selectMnemonicOption_createMnemonic_headline"
        .localized(configuration: localizationConfiguration)
    private(set) lazy var createMnemonicSubheadline = "bip39UserFlow_selectMnemonicOption_createMnemonic_subheadline"
        .localized(configuration: localizationConfiguration)
    private(set) lazy var importMnemonicBody = "bip39UserFlow_selectMnemonicOption_importMnemonic_body"
        .localized(configuration: localizationConfiguration)
    private(set) lazy var importMnemonicHeadline = "bip39UserFlow_selectMnemonicOption_importMnemonic_headline"
        .localized(configuration: localizationConfiguration)
    private(set) lazy var importMnemonicSubheadline = "bip39UserFlow_selectMnemonicOption_importMnemonic_subheadline"
        .localized(configuration: localizationConfiguration)

    private let localizationConfiguration: LocalizationConfigurable

    init(localizationConfiguration: LocalizationConfigurable) {
        self.localizationConfiguration = localizationConfiguration
    }
}

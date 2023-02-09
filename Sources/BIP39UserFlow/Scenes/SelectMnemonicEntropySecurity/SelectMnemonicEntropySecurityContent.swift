final class SelectMnemonicEntropySecurityContent {
    private(set) lazy var title = "bip39UserFlow_selectMnemonicEntropySecurity_title".localized(configuration: localizationConfiguration)
    private(set) lazy var body = "bip39UserFlow_selectMnemonicEntropySecurity_body".localized(configuration: localizationConfiguration)
    private(set) lazy var primaryCTA = "bip39UserFlow_shared_primaryCTA_continue".localized(configuration: localizationConfiguration)

    func mnemonicWordCount(_ mnemonicWordCount: MnemonicWordCount) -> String {
        "bip39UserFlow_selectMnemonicEntropySecurity_mnemonicWordCount"
            .localized(configuration: localizationConfiguration, arguments: [mnemonicWordCount.value])
    }

    private let localizationConfiguration: LocalizationConfigurable

    init(localizationConfiguration: LocalizationConfigurable) {
        self.localizationConfiguration = localizationConfiguration
    }
}

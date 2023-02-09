import BIP39

typealias InMemoryStoring = LocalizationConfigurationAccessing
    & MnemonicConfigurationAccessing
    & MnemonicEntropySecurityAccessing
    & MnemonicAccessing
    & MnemonicPassphraseAccessing

final class InMemoryStorage {
    static let shared = InMemoryStorage()

    private(set) lazy var localizationConfiguration: LocalizationConfigurable = LocalizationConfiguration()
    private(set) lazy var mnemonicConfiguration: MnemonicConfigurable = MnemonicConfiguration()
    private(set) lazy var mnemonicEntropySecurity = mnemonicConfiguration.entropySecurity
    private(set) lazy var mnemonic = ""
    private(set) lazy var mnemonicPassphrase = ""
}

// MARK: - InMemoryStoring
extension InMemoryStorage: InMemoryStoring {
    func setLocalizationConfiguration(_ configuration: LocalizationConfigurable) {
        localizationConfiguration = configuration
    }

    func setMnemonicConfiguration(_ configuration: MnemonicConfigurable) {
        mnemonicConfiguration = configuration
    }

    func setMnemonicEntropySecurity(_ entropySecurity: EntropySecurity) {
        mnemonicEntropySecurity = entropySecurity
    }

    func setMnemonic(_ mnemonic: String) {
        self.mnemonic = mnemonic
    }

    func setMnemonicPassphrase(_ passphrase: String) {
        mnemonicPassphrase = passphrase
    }
}

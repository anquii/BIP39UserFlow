import BIP39

struct InMemoryRepository {
    private let storage: InMemoryStoring

    init(storage: InMemoryStoring) {
        self.storage = storage
    }
}

// MARK: - LocalizationConfigurationAccessing
extension InMemoryRepository: LocalizationConfigurationAccessing {
    var localizationConfiguration: LocalizationConfigurable {
        storage.localizationConfiguration
    }

    func setLocalizationConfiguration(_ configuration: LocalizationConfigurable) {
        storage.setLocalizationConfiguration(configuration)
    }
}

// MARK: - MnemonicConfigurationAccessing
extension InMemoryRepository: MnemonicConfigurationAccessing {
    var mnemonicConfiguration: MnemonicConfigurable {
        storage.mnemonicConfiguration
    }

    func setMnemonicConfiguration(_ configuration: MnemonicConfigurable) {
        storage.setMnemonicConfiguration(configuration)
    }
}

// MARK: - MnemonicEntropySecurityAccessing
extension InMemoryRepository: MnemonicEntropySecurityAccessing {
    var mnemonicEntropySecurity: EntropySecurity {
        storage.mnemonicEntropySecurity
    }

    func setMnemonicEntropySecurity(_ entropySecurity: EntropySecurity) {
        storage.setMnemonicEntropySecurity(entropySecurity)
    }
}

// MARK: - MnemonicAccessing
extension InMemoryRepository: MnemonicAccessing {
    var mnemonic: String {
        storage.mnemonic
    }

    func setMnemonic(_ mnemonic: String) {
        storage.setMnemonic(mnemonic)
    }
}

// MARK: - MnemonicPassphraseAccessing
extension InMemoryRepository: MnemonicPassphraseAccessing {
    var mnemonicPassphrase: String {
        storage.mnemonicPassphrase
    }

    func setMnemonicPassphrase(_ passphrase: String) {
        storage.setMnemonicPassphrase(passphrase)
    }
}

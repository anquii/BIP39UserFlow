import BIP39

protocol MnemonicCreating {
    func createMnemonic()
}

struct CreateMnemonicInteractor {
    private let repository: MnemonicConfigurationReading & MnemonicEntropySecurityReading & MnemonicWriting
    private let entropyGenerator: EntropyGenerating
    private let constructor: MnemonicConstructing

    init(
        repository: MnemonicConfigurationReading & MnemonicEntropySecurityReading & MnemonicWriting,
        entropyGenerator: EntropyGenerating,
        constructor: MnemonicConstructing
    ) {
        self.repository = repository
        self.entropyGenerator = entropyGenerator
        self.constructor = constructor
    }
}

// MARK: - MnemonicCreating
extension CreateMnemonicInteractor: MnemonicCreating {
    func createMnemonic() {
        let entropy = entropyGenerator.entropy(security: repository.mnemonicEntropySecurity)
        let mnemonic = constructor.mnemonic(entropy: entropy, wordList: repository.mnemonicConfiguration.wordListProvider.wordList)
        repository.setMnemonic(mnemonic)
    }
}

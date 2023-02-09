import BIP39

public protocol MnemonicConfigurable {
    var options: MnemonicOptions { get }
    var entropySecurity: EntropySecurity { get }
    var wordListProvider: WordListProviding { get }
    /// In the range of 3 to 24 words.
    var requiredConfirmedWordCount: Int { get }
    var requireEntropySecuritySelection: Bool { get }
    var supportPassphrase: Bool { get }
}

public struct MnemonicConfiguration: MnemonicConfigurable {
    public let options: MnemonicOptions
    public let entropySecurity: EntropySecurity
    public let wordListProvider: WordListProviding
    public let requiredConfirmedWordCount: Int
    public let requireEntropySecuritySelection: Bool
    public let supportPassphrase: Bool

    public init(
        options: MnemonicOptions = .all,
        entropySecurity: EntropySecurity = .strongest,
        wordListProvider: WordListProviding = EnglishWordListProvider(),
        requiredConfirmedWordCount: Int = 4,
        requireEntropySecuritySelection: Bool = true,
        supportPassphrase: Bool = true
    ) {
        self.options = options
        self.entropySecurity = entropySecurity
        self.wordListProvider = wordListProvider
        self.requiredConfirmedWordCount = requiredConfirmedWordCount
        self.requireEntropySecuritySelection = requireEntropySecuritySelection
        self.supportPassphrase = supportPassphrase
    }
}

protocol MnemonicPassphraseReading {
    var mnemonicPassphrase: String { get }
}

protocol MnemonicPassphraseWriting {
    func setMnemonicPassphrase(_ passphrase: String)
}

typealias MnemonicPassphraseAccessing = MnemonicPassphraseReading & MnemonicPassphraseWriting

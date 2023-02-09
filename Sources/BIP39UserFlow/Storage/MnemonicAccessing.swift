protocol MnemonicReading {
    var mnemonic: String { get }
}

protocol MnemonicWriting {
    func setMnemonic(_ mnemonic: String)
}

typealias MnemonicAccessing = MnemonicReading & MnemonicWriting

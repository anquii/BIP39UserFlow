import BIP39

protocol MnemonicEntropySecurityReading {
    var mnemonicEntropySecurity: EntropySecurity { get }
}

protocol MnemonicEntropySecurityWriting {
    func setMnemonicEntropySecurity(_ entropySecurity: EntropySecurity)
}

typealias MnemonicEntropySecurityAccessing = MnemonicEntropySecurityReading & MnemonicEntropySecurityWriting

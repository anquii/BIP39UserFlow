protocol MnemonicConfigurationReading {
    var mnemonicConfiguration: MnemonicConfigurable { get }
}

protocol MnemonicConfigurationWriting {
    func setMnemonicConfiguration(_ configuration: MnemonicConfigurable)
}

typealias MnemonicConfigurationAccessing = MnemonicConfigurationReading & MnemonicConfigurationWriting

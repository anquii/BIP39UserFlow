protocol MnemonicWordsProviding {
    var mnemonicWords: [MnemonicWord] { get }
}

protocol MnemonicWordsSlicing {
    var slicedMnemonicWords: [MnemonicWord] { get }
}

final class MnemonicWordsInteractor: MnemonicWordsProviding, MnemonicWordsSlicing {
    private(set) lazy var mnemonicWords = repository
        .mnemonic
        .components(separatedBy: .whitespaces)
        .enumerated()
        .compactMap { (index, value) in
            MnemonicWord(index: index + 1, value: value)
        }
    private(set) lazy var slicedMnemonicWords = mnemonicWords
        .shuffled()
        .prefix(repository.mnemonicConfiguration.requiredConfirmedWordCount)
        .sorted {
            $0.index < $1.index
        }

    private let repository: MnemonicConfigurationReading & MnemonicReading

    init(repository: MnemonicConfigurationReading & MnemonicReading) {
        self.repository = repository
    }
}

import BIP39
import Combine

final class SelectMnemonicEntropySecurityViewModel: ObservableObject {
    private(set) lazy var mnemonicWordCounts = EntropySecurity.allCases.map {
        Int(entropySecurity: $0)
    }.sorted {
        $0 > $1
    }.enumerated().map { index, value in
        MnemonicWordCount(index: index, value: value)
    }
    private lazy var selectedMnemonicWordCount: MnemonicWordCount = {
        let entropySecurityWordCount = Int(entropySecurity: repository.mnemonicEntropySecurity)
        return mnemonicWordCounts.first {
            $0.value == entropySecurityWordCount
        }!
    }() {
        willSet {
            let entropySecurity = EntropySecurity(wordCount: newValue.value)
            repository.setMnemonicEntropySecurity(entropySecurity)
            objectWillChange.send()
        }
    }

    let content: SelectMnemonicEntropySecurityContent
    private let repository: MnemonicEntropySecurityAccessing

    init(content: SelectMnemonicEntropySecurityContent, repository: MnemonicEntropySecurityAccessing) {
        self.content = content
        self.repository = repository
    }
}

extension SelectMnemonicEntropySecurityViewModel {
    var primaryCTAWireframeContent: WireframeContent {
        .init(component: .createMnemonic)
    }

    func selectMnemonicWordCount(_ mnemonicWordCount: MnemonicWordCount) {
        selectedMnemonicWordCount = mnemonicWordCount
    }

    func isMnemonicWordCountSelected(index: Int) -> Bool {
        selectedMnemonicWordCount.index == index
    }

    func displaySeparator(mnemonicWordCountIndex: Int) -> Bool {
        let isIndexSelected = isMnemonicWordCountSelected(index: mnemonicWordCountIndex)
        let isNextIndexSelected = isMnemonicWordCountSelected(index: mnemonicWordCountIndex + 1)
        let isLastIndex = mnemonicWordCountIndex == mnemonicWordCounts.last!.index

        if isIndexSelected || isNextIndexSelected || isLastIndex {
            return false
        } else {
            return true
        }
    }
}

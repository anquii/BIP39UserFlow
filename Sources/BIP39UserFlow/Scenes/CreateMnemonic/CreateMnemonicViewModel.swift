import Combine

final class CreateMnemonicViewModel: ObservableObject {
    private(set) lazy var listItems = mnemonicWordsInteractor.mnemonicWords.enumerated().map { index, mnemonicWord in
        CreateMnemonicListItem(index: index, mnemonicWord: mnemonicWord)
    }
    private lazy var highlightedListItemIndexes: Set<Int> = [listItems.first!.index]
    private lazy var highlightedListItem = listItems.first! {
        willSet {
            highlightedListItemIndexes.insert(newValue.index)
            objectWillChange.send()
        }
    }

    let content: CreateMnemonicContent
    private let repository: MnemonicEntropySecurityReading
    private let interactor: MnemonicCreating
    private let mnemonicWordsInteractor: MnemonicWordsProviding

    init(
        content: CreateMnemonicContent,
        repository: MnemonicEntropySecurityReading,
        interactor: MnemonicCreating,
        mnemonicWordsInteractor: MnemonicWordsProviding
    ) {
        self.content = content
        self.repository = repository
        self.interactor = interactor
        self.mnemonicWordsInteractor = mnemonicWordsInteractor
        interactor.createMnemonic()
    }
}

extension CreateMnemonicViewModel {
    var mnemonicWordCount: Int {
        .init(entropySecurity: repository.mnemonicEntropySecurity)
    }

    var hasHighlightedListItems: Bool {
        highlightedListItemIndexes.count == mnemonicWordCount
    }

    var primaryCTAWireframeContent: WireframeContent {
        .init(component: .confirmMnemonic)
    }

    func highlightListItem(_ item: CreateMnemonicListItem) {
        highlightedListItem = item
    }

    func isListItemHighlighted(index: Int) -> Bool {
        highlightedListItem.index == index
    }

    func displaySeparator(listItemIndex: Int) -> Bool {
        let isIndexHighlighted = isListItemHighlighted(index: listItemIndex)
        let isNextIndexHighlighted = isListItemHighlighted(index: listItemIndex + 1)
        let isLastIndex = listItemIndex == listItems.last!.index

        if isIndexHighlighted || isNextIndexHighlighted || isLastIndex {
            return false
        } else {
            return true
        }
    }
}

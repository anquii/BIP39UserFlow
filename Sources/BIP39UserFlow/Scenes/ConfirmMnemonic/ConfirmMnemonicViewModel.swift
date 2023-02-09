import Combine

final class ConfirmMnemonicViewModel: ObservableObject {
    typealias ListItemIndex = Int

    private(set) lazy var listItems = mnemonicWordsInteractor.slicedMnemonicWords.enumerated().map { index, mnemonicWord in
        ConfirmMnemonicListItem(index: index, mnemonicWord: mnemonicWord)
    }
    private lazy var highlightedListItem = listItems.first! {
        willSet {
            objectWillChange.send()
        }
    }
    private(set) lazy var menuItems: [ConfirmMnemonicMenuItem] = {
        var values = Set<String>()
        mnemonicWordsInteractor.mnemonicWords.forEach {
            values.insert($0.value)
        }
        return values.shuffled().map {
            ConfirmMnemonicMenuItem(value: $0)
        }
    }()
    @Published private var selectedMenuItemValues = [ListItemIndex: String]()

    let content: ConfirmMnemonicContent
    private let repository: MnemonicConfigurationReading
    private let mnemonicWordsInteractor: MnemonicWordsProviding & MnemonicWordsSlicing

    init(
        content: ConfirmMnemonicContent,
        repository: MnemonicConfigurationReading,
        mnemonicWordsInteractor: MnemonicWordsProviding & MnemonicWordsSlicing
    ) {
        self.content = content
        self.repository = repository
        self.mnemonicWordsInteractor = mnemonicWordsInteractor
    }
}

extension ConfirmMnemonicViewModel {
    var areMenuItemSelectionsValid: Bool {
        guard selectedMenuItemValues.count == repository.mnemonicConfiguration.requiredConfirmedWordCount else {
            return false
        }
        return selectedMenuItemValues.allSatisfy { index, value in
            listItems[index].mnemonicWord.value == value
        }
    }

    var primaryCTAWireframeContent: WireframeContent {
        if repository.mnemonicConfiguration.supportPassphrase {
            return .init(component: .createMnemonicPassphrase)
        } else {
            return .init(component: .nameWallet)
        }
    }

    func selectMenuItem(_ item: ConfirmMnemonicMenuItem, listItemIndex: Int) {
        selectedMenuItemValues.updateValue(item.value, forKey: listItemIndex)
    }

    func selectedMenuItemText(listItemIndex: Int) -> String {
        guard let text = selectedMenuItemValues[listItemIndex] else {
            return content.unselectedMnemonicWord
        }
        return text
    }

    func highlightListItem(_ item: ConfirmMnemonicListItem) {
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

import XCTest
@testable import BIP39UserFlow

final class MnemonicWordsInteractorTests: XCTestCase {
    private let repository = InMemoryRepository(storage: InMemoryStorage())
    private static let mnemonic = "loop jump since logic lecture easy shift arrive trap juice cause rough"

    private func sut() -> MnemonicWordsInteractor {
        .init(repository: repository)
    }

    func testGivenMnemonic_WhenGetWords_ThenCorrectWordCount_AndFirstWord_AndLastWord() {
        repository.setMnemonic(Self.mnemonic)
        let mnemonicWords = sut().mnemonicWords
        XCTAssertEqual(mnemonicWords.count, 12)
        XCTAssertEqual(mnemonicWords[0].index, 1)
        XCTAssertEqual(mnemonicWords[0].value, "loop")
        XCTAssertEqual(mnemonicWords[11].index, 12)
        XCTAssertEqual(mnemonicWords[11].value, "rough")
    }

    func testGivenRequiredConfirmedWordCount_AndMnemonic_WhenGetSlicedWords_ThenCorrectWordCount() {
        let mnemonicConfiguration = MnemonicConfiguration(requiredConfirmedWordCount: 6)
        repository.setMnemonicConfiguration(mnemonicConfiguration)
        repository.setMnemonic(Self.mnemonic)
        XCTAssertEqual(sut().slicedMnemonicWords.count, 6)
    }
}

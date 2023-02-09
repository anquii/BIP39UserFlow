import XCTest
import BIP39
@testable import BIP39UserFlow

final class CreateMnemonicInteractorTests: XCTestCase {
    private let repository = InMemoryRepository(storage: InMemoryStorage())
    private let entropyGenerator = EntropyGenerator()
    private let mnemmonicConstructor = MnemonicConstructor()

    private func sut() -> CreateMnemonicInteractor {
        .init(repository: repository, entropyGenerator: entropyGenerator, constructor: mnemmonicConstructor)
    }

    func testWhenCreateMnemonic_ThenNoErrorThrown() {
        XCTAssertNoThrow(try sut().createMnemonic())
    }

    func testWhenCreateMnemonic_ThenStoredMnemonicNotEmpty() throws {
        try sut().createMnemonic()
        XCTAssertNotEqual(repository.mnemonic, "")
    }

    func testGivenStoredEntropySecurity_WhenCreateMnemonic_AndCountWords_ThenMatchEntropySecurityEquivalent() throws {
        try EntropySecurity.allCases.forEach {
            repository.setMnemonicEntropySecurity($0)
            try sut().createMnemonic()
            XCTAssertEqual(repository.mnemonic.components(separatedBy: .whitespaces).count, Int(entropySecurity: $0))
        }
    }
}

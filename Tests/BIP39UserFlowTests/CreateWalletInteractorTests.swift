import XCTest
import BIP39
@testable import BIP39UserFlow

final class CreateWalletInteractorTests: XCTestCase {
    private let repository = InMemoryRepository(storage: InMemoryStorage())
    private let seedDerivator = SeedDerivator()
    private static let mnemonic = "loop jump since logic lecture easy shift arrive trap juice cause rough"
    private static let mnemonicPassphrase = "passphrase"

    private func sut() -> CreateWalletInteractor {
        .init(repository: repository, seedDerivator: seedDerivator)
    }

    func testGivenName_WhenCreateWallet_ThenWalletHasName() {
        let name = "Spending"
        let wallet = sut().createWallet(name: name)
        XCTAssertEqual(wallet.name, name)
    }

    func testGivenMnemonic_WhenCreateWallet_AndGetSeed_ThenMatchExpectedSeed() {
        repository.setMnemonic(Self.mnemonic)
        let wallet = sut().createWallet(name: "")
        let expectedSeed = seedDerivator.seed(mnemonic: Self.mnemonic)
        XCTAssertEqual(wallet.seed, expectedSeed)
    }

    func testGivenMnemonic_AndEmptyPassphrase_WhenCreateWallet_AndGetSeed_ThenMatchExpectedSeed() {
        repository.setMnemonic(Self.mnemonic)
        repository.setMnemonicPassphrase("")
        let wallet = sut().createWallet(name: "")
        let expectedSeed = seedDerivator.seed(mnemonic: Self.mnemonic)
        XCTAssertEqual(wallet.seed, expectedSeed)
    }

    func testGivenMnemonic_AndPassphrase_WhenCreateWallet_AndGetSeed_ThenMatchExpectedSeed() {
        repository.setMnemonic(Self.mnemonic)
        repository.setMnemonicPassphrase(Self.mnemonicPassphrase)
        let wallet = sut().createWallet(name: "")
        let expectedSeed = seedDerivator.seed(mnemonic: Self.mnemonic, passphrase: Self.mnemonicPassphrase)
        XCTAssertEqual(wallet.seed, expectedSeed)
    }
}

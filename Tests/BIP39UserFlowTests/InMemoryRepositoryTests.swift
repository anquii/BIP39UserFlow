import XCTest
import BIP39
@testable import BIP39UserFlow

final class InMemoryRepositoryTests: XCTestCase {
    private let storage = InMemoryStorage()

    private func sut() -> InMemoryRepository {
        .init(storage: storage)
    }

    func testGivenValue_WhenSetAndGet_AndStorageGet_ThenEqual() {
        let sut = self.sut()
        let uuidString = UUID().uuidString
        sut.setMnemonic(uuidString)
        XCTAssertEqual(sut.mnemonic, uuidString)
        XCTAssertEqual(storage.mnemonic, uuidString)
    }

    func testGivenLocalizationConfiguration_WhenSetAndGet_ThenEqual() {
        let sut = self.sut()
        // Setting `useCustomStrings` to differ from the default configuration.
        let localizationConfiguration = LocalizationConfiguration(useCustomStrings: true)
        sut.setLocalizationConfiguration(localizationConfiguration)
        XCTAssertEqual(sut.localizationConfiguration.useCustomStrings, localizationConfiguration.useCustomStrings)
    }

    func testGivenMnemonicConfiguration_WhenSetAndGet_ThenEqual() {
        let sut = self.sut()
        // Setting `supportPassphrase` to differ from the default configuration.
        let mnemonicConfiguration = MnemonicConfiguration(supportPassphrase: false)
        sut.setMnemonicConfiguration(mnemonicConfiguration)
        XCTAssertEqual(sut.mnemonicConfiguration.supportPassphrase, mnemonicConfiguration.supportPassphrase)
    }

    func testGivenMnemonicEntropySecurity_WhenSetAndGet_ThenEqual() {
        let sut = self.sut()
        let mnemonicEntropySecurity = EntropySecurity.medium
        sut.setMnemonicEntropySecurity(mnemonicEntropySecurity)
        XCTAssertEqual(sut.mnemonicEntropySecurity, mnemonicEntropySecurity)
    }

    func testGivenMnemonic_WhenSetAndGet_ThenEqual() {
        let sut = self.sut()
        let uuidString = UUID().uuidString
        sut.setMnemonic(uuidString)
        XCTAssertEqual(sut.mnemonic, uuidString)
    }

    func testGivenMnemonicPassphrase_WhenSetAndGet_ThenEqual() {
        let sut = self.sut()
        let uuidString = UUID().uuidString
        sut.setMnemonicPassphrase(uuidString)
        XCTAssertEqual(sut.mnemonicPassphrase, uuidString)
    }
}

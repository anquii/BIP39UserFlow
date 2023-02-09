import XCTest
import BIP39
@testable import BIP39UserFlow

final class EntropySecurityWordCountTests: XCTestCase {
    func testGivenWeakestEntropySecurity_WhenWordCount_ThenEqual12() {
        XCTAssertEqual(Int(entropySecurity: .weakest), 12)
    }

    func testGivenWeakEntropySecurity_WhenWordCount_ThenEqual15() {
        XCTAssertEqual(Int(entropySecurity: .`weak`), 15)
    }

    func testGivenMediumEntropySecurity_WhenWordCount_ThenEqual18() {
        XCTAssertEqual(Int(entropySecurity: .medium), 18)
    }

    func testGivenStrongEntropySecurity_WhenWordCount_ThenEqual21() {
        XCTAssertEqual(Int(entropySecurity: .strong), 21)
    }

    func testGivenStrongestEntropySecurity_WhenWordCount_ThenEqual24() {
        XCTAssertEqual(Int(entropySecurity: .strongest), 24)
    }

    func testGivenWordCount12_WhenInitEntropySecurity_ThenEqualWeakest() {
        XCTAssertEqual(EntropySecurity(wordCount: 12), .weakest)
    }

    func testGivenWordCount15_WhenInitEntropySecurity_ThenEqualWeak() {
        XCTAssertEqual(EntropySecurity(wordCount: 15), .`weak`)
    }

    func testGivenWordCount18_WhenInitEntropySecurity_ThenEqualMedium() {
        XCTAssertEqual(EntropySecurity(wordCount: 18), .medium)
    }

    func testGivenWordCount21_WhenInitEntropySecurity_ThenEqualStrong() {
        XCTAssertEqual(EntropySecurity(wordCount: 21), .strong)
    }

    func testGivenWordCount24_WhenInitEntropySecurity_ThenEqualStrongest() {
        XCTAssertEqual(EntropySecurity(wordCount: 24), .strongest)
    }
}

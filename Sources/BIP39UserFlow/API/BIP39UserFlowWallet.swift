import Foundation

public struct BIP39UserFlowWallet: Identifiable {
    public let id = UUID()
    public let dateCreated = Date()
    public let name: String
    public let seed: Data
}

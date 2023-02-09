import Combine

public struct BIP39UserFlowPublishers {
    static let internalWalletPublisher = PassthroughSubject<BIP39UserFlowWallet, Never>()
    static let internalDismissPublisher = PassthroughSubject<Void, Never>()

    /// Sends a value of type `BIP39UserFlowWallet` when user finishes the flow. Stream terminates on `deinit`.
    public static let walletPublisher = internalWalletPublisher.eraseToAnyPublisher()
    /// Sends a void value when user taps the dismiss button. Stream terminates on `deinit`.
    public static let dismissPublisher = internalDismissPublisher.eraseToAnyPublisher()

    private init() {}
}

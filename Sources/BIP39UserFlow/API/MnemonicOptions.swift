public struct MnemonicOptions: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let createMnemonic = Self(rawValue: 1 << 0)
    public static let importMnemonic = Self(rawValue: 1 << 1)

    public static let all: MnemonicOptions = [.createMnemonic, .importMnemonic]
}

import SwiftUI

public protocol LocalizationConfigurable {
    var useCustomStrings: Bool { get }
    var customStringsBundleIdentifier: String { get }
    var customStringsTableName: String { get }
}

public struct LocalizationConfiguration: LocalizationConfigurable {
    public let useCustomStrings: Bool
    public let customStringsBundleIdentifier: String
    public let customStringsTableName: String

    public init(
        useCustomStrings: Bool = false,
        customStringsBundleIdentifier: String = "",
        customStringsTableName: String = ""
    ) {
        self.useCustomStrings = useCustomStrings
        self.customStringsBundleIdentifier = customStringsBundleIdentifier
        self.customStringsTableName = customStringsTableName
    }
}

fileprivate struct LocalizationConfigurationEnvironmentKey: EnvironmentKey {
    static let defaultValue: LocalizationConfigurable = LocalizationConfiguration()
}

extension EnvironmentValues {
    var localizationConfiguration: LocalizationConfigurable {
        get { self[LocalizationConfigurationEnvironmentKey.self] }
        set { self[LocalizationConfigurationEnvironmentKey.self] = newValue }
    }
}

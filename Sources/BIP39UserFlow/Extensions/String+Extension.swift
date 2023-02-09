import Foundation

extension String {
    func localized(configuration: LocalizationConfigurable) -> Self {
        switch configuration.useCustomStrings {
        case true:
            return NSLocalizedString(
                self,
                tableName: configuration.customStringsTableName,
                bundle: Bundle(identifier: configuration.customStringsBundleIdentifier)!,
                comment: ""
            )
        case false:
            return NSLocalizedString(self, bundle: .module, comment: "")
        }
    }

    func localized(configuration: LocalizationConfigurable, arguments: [CVarArg]) -> Self {
        .init(format: localized(configuration: configuration), arguments: arguments)
    }

    static func random(lengthRange: ClosedRange<Int>) -> Self {
        .init((0..<lengthRange.randomElement()!).map { _ in
            "abcdefghijklmnopqrstuvwxyz".randomElement()!
        })
    }
}

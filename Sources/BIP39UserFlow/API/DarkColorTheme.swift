import SwiftUI

public struct DarkColorTheme: ColorThemable {
    public var background = Color(.systemBackground)
    public var background2 = Color(.secondarySystemBackground)
    public var background3 = Color(.tertiarySystemBackground)
    public var fill = Color(.systemFill)
    public var label = Color(.label)
    public var label2 = Color(.secondaryLabel)
    public var label3 = Color(.tertiaryLabel)
    public var separator = Color(hex: 0x444447)
    public var accent = Color.accentColor

    public init() {}
}

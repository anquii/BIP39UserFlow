import SwiftUI

public struct LightColorTheme: ColorThemable {
    public var background = Color(.systemGray6)
    public var background2 = Color(hex: 0xFDFDFE)
    public var background3 = Color(hex: 0xEBEBEF)
    public var fill = Color(hex: 0xC0C0C8)
    public var label = Color(.label)
    public var label2 = Color(hex: 0x5F6473)
    public var label3 = Color(.systemGray2)
    public var separator = Color(hex: 0xC8C8C8)
    public var accent = Color.accentColor

    public init() {}
}

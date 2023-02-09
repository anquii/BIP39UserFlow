import SwiftUI

public protocol ColorThemable {
    var background: Color { get }
    var background2: Color { get }
    var background3: Color { get }
    var fill: Color { get }
    var label: Color { get }
    var label2: Color { get }
    var label3: Color { get }
    var separator: Color { get }
    var accent: Color { get }
}

fileprivate struct ColorThemeEnvironmentKey: EnvironmentKey {
    static let defaultValue: ColorThemable = LightColorTheme()
}

extension EnvironmentValues {
    var colorTheme: ColorThemable {
        get { self[ColorThemeEnvironmentKey.self] }
        set { self[ColorThemeEnvironmentKey.self] = newValue }
    }
}

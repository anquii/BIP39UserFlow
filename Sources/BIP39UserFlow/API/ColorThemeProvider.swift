import SwiftUI

public protocol ColorThemeProviding {
    func colorTheme(scheme: ColorScheme) -> ColorThemable
}

public struct ColorThemeProvider: ColorThemeProviding {
    public func colorTheme(scheme: ColorScheme) -> ColorThemable {
        switch scheme {
        case .light:
            return lightColorTheme
        case .dark:
            return darkColorTheme
        @unknown default:
            preconditionFailure()
        }
    }

    private let lightColorTheme: ColorThemable
    private let darkColorTheme: ColorThemable

    public init(
        lightColorTheme: ColorThemable = LightColorTheme(),
        darkColorTheme: ColorThemable = DarkColorTheme()
    ) {
        self.lightColorTheme = lightColorTheme
        self.darkColorTheme = darkColorTheme
    }
}

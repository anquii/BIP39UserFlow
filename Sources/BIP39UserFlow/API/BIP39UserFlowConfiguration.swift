public protocol BIP39UserFlowConfigurable {
    var colorThemeProvider: ColorThemeProviding { get }
    var localizationConfiguration: LocalizationConfigurable { get }
    var mnemonicConfiguration: MnemonicConfigurable { get }
}

public struct BIP39UserFlowConfiguration: BIP39UserFlowConfigurable {
    public let colorThemeProvider: ColorThemeProviding
    public let localizationConfiguration: LocalizationConfigurable
    public let mnemonicConfiguration: MnemonicConfigurable

    public init(
        colorThemeProvider: ColorThemeProviding = ColorThemeProvider(),
        localizationConfiguration: LocalizationConfigurable = LocalizationConfiguration(),
        mnemonicConfiguration: MnemonicConfigurable = MnemonicConfiguration()
    ) {
        self.colorThemeProvider = colorThemeProvider
        self.localizationConfiguration = localizationConfiguration
        self.mnemonicConfiguration = mnemonicConfiguration
    }
}

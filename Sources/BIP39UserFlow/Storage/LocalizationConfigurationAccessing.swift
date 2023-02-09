protocol LocalizationConfigurationReading {
    var localizationConfiguration: LocalizationConfigurable { get }
}

protocol LocalizationConfigurationWriting {
    func setLocalizationConfiguration(_ configuration: LocalizationConfigurable)
}

typealias LocalizationConfigurationAccessing = LocalizationConfigurationReading & LocalizationConfigurationWriting

import BIP39

extension EntropySecurity: CaseIterable {
    public static var allCases: [EntropySecurity] = [
        .weakest,
        .weak,
        .medium,
        .strong,
        .strongest
    ]
}

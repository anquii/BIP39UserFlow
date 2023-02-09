import BIP39

extension Int {
    init(entropySecurity: EntropySecurity) {
        switch entropySecurity {
        case .weakest:
            self = 12
        case .weak:
            self = 15
        case .medium:
            self = 18
        case .strong:
            self = 21
        case .strongest:
            self = 24
        }
    }
}

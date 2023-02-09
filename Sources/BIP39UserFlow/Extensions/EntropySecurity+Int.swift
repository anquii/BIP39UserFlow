import BIP39

extension EntropySecurity {
    init(wordCount: Int) {
        switch wordCount {
        case 12:
            self = .weakest
        case 15:
            self = .weak
        case 18:
            self = .medium
        case 21:
            self = .strong
        case 24:
            self = .strongest
        default:
            preconditionFailure()
        }
    }
}

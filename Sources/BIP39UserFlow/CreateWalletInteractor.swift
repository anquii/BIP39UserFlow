import BIP39

protocol CreateWalletInteracting {
    func createWallet(name: String) -> BIP39UserFlowWallet
}

final class CreateWalletInteractor {
    private let repository: MnemonicReading & MnemonicPassphraseReading
    private let seedDerivator: SeedDerivating

    init(repository: MnemonicReading & MnemonicPassphraseReading, seedDerivator: SeedDerivating) {
        self.repository = repository
        self.seedDerivator = seedDerivator
    }
}

// MARK: - CreateWalletInteracting
extension CreateWalletInteractor: CreateWalletInteracting {
    func createWallet(name: String) -> BIP39UserFlowWallet {
        if repository.mnemonicPassphrase.isEmpty {
            let seed = seedDerivator.seed(mnemonic: repository.mnemonic)
            return BIP39UserFlowWallet(name: name, seed: seed)
        } else {
            let seed = seedDerivator.seed(mnemonic: repository.mnemonic, passphrase: repository.mnemonicPassphrase)
            return BIP39UserFlowWallet(name: name, seed: seed)
        }
    }
}

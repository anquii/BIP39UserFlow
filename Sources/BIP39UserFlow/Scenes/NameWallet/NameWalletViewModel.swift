import Combine

struct NameWalletViewModel {
    let content: NameWalletContent
    let createWalletInteractor: CreateWalletInteracting

    init(content: NameWalletContent, createWalletInteractor: CreateWalletInteracting) {
        self.content = content
        self.createWalletInteractor = createWalletInteractor
    }
}

extension NameWalletViewModel {
    func onPrimaryCTATapped(text: String) {
        let wallet = createWalletInteractor.createWallet(name: text)
        BIP39UserFlowPublishers.internalWalletPublisher.send(wallet)
    }
}

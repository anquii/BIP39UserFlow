import BIP39UserFlow
import Combine

final class BIP39UserFlowDemoViewModel: ObservableObject {
    let text = "BIP39UserFlow"
    @Published var isPresented = false
    let viewConstructor: BIP39UserFlowViewConstructor
    private let configuration = BIP39UserFlowConfiguration()
    private var cancellables = Set<AnyCancellable>()

    init() {
        viewConstructor = BIP39UserFlowViewConstructor(configuration: configuration)
        BIP39UserFlowPublishers.walletPublisher.sink { [unowned self] wallet in
            print(wallet)
            isPresented = false
        }
        .store(in: &cancellables)
        BIP39UserFlowPublishers.dismissPublisher.sink { [unowned self] in
            isPresented = false
        }
        .store(in: &cancellables)
    }
}

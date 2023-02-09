import SwiftUI
import UIKit

extension UIApplication {
    var hasBottomSafeAreaInsets: Bool {
        let keyWindow = connectedScenes.compactMap {
            $0 as? UIWindowScene
        }.flatMap {
            $0.windows
        }.first {
            $0.isKeyWindow
        }
        guard let safeAreaInsets = keyWindow?.safeAreaInsets else {
            return false
        }
        return safeAreaInsets.bottom > 0
    }
}

fileprivate struct HasBottomSafeAreaInsetsEnvironmentKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var hasBottomSafeAreaInsets: Bool {
        get { self[HasBottomSafeAreaInsetsEnvironmentKey.self] }
        set { self[HasBottomSafeAreaInsetsEnvironmentKey.self] = newValue }
    }
}

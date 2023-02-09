import BIP39UserFlow
import SwiftUI

struct BIP39UserFlowDemoView: View {
    @StateObject var model = BIP39UserFlowDemoViewModel()

    var body: some View {
        Button(action: {
            model.isPresented = true
        }) {
            Text(model.text)
                .font(.body)
                .fontWeight(.medium)
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .padding(.horizontal, 30)
                .padding(.vertical, 15)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5)
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $model.isPresented) {
            model.viewConstructor.view()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

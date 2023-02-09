import SwiftUI

struct ImportMnemonicView: View {
    @Environment(\.colorTheme) private var colorTheme
    @Environment(\.hasBottomSafeAreaInsets) private var hasBottomSafeAreaInsets

    @State var model: ImportMnemonicViewModel
    @State private var text = ""
    @FocusState private var isKeyboardFocused: Bool

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: .zero) {
                VerticalSpacer(height: .medium)
                Group {
                    TitleText(model.content.title)
                        .foregroundColor(colorTheme.label)
                    VerticalSpacer(height: .medium2)
                    BodyText(model.content.body)
                        .foregroundColor(colorTheme.label2)
                }
                VerticalSpacer(height: .large2)
                SecureTextField(text: $text, placeholderText: model.content.placeholder)
                    .textContentType(.password)
                    .focused($isKeyboardFocused)
                    .onTapGesture {
                        isKeyboardFocused = true
                    }
                    .onChange(of: text) {
                        model.textDidChange($0)
                    }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        .background(colorTheme.background)
        .navigationTitle("")
        .safeAreaInset(edge: .bottom, spacing: .zero) {
            VStack(spacing: .zero) {
                VerticalSpacer(height: .medium2)
                primaryButtonView
                    .disabled(text.isEmpty)
                if !hasBottomSafeAreaInsets {
                    VerticalSpacer(height: .medium)
                }
            }
        }
        .ignoresSafeArea(.keyboard)
        .scrollDismissesKeyboard(.interactively)
        .onTapGesture {
            isKeyboardFocused = false
        }
    }
}

// MARK: - Connections
fileprivate extension ImportMnemonicView {
    var primaryButtonView: some View {
        let connection = WireframeConnection {
            PrimaryButtonView(text: model.content.primaryCTA)
                .foregroundColor(colorTheme.accent)
                .background(colorTheme.background2)
                .cornerRadius(ViewAttributes.cornerRadius)
        }
        return model.primaryCTAWireframeContent.view(connection: connection)
    }
}

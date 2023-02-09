import SwiftUI

struct NameWalletView: View {
    @Environment(\.colorTheme) private var colorTheme
    @Environment(\.hasBottomSafeAreaInsets) private var hasBottomSafeAreaInsets

    @State var model: NameWalletViewModel
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
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        BodyText(model.content.placeholder)
                            .foregroundColor(colorTheme.label3)
                    }
                    TextField("", text: $text)
                        .font(.body)
                        .fontWeight(.regular)
                        .fontDesign(.rounded)
                        .foregroundColor(colorTheme.label2)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .focused($isKeyboardFocused)
                        .onTapGesture {
                            isKeyboardFocused = true
                        }
                }
                .frame(height: 20)
                .padding()
                .background(colorTheme.background2)
                .cornerRadius(ViewAttributes.cornerRadius)
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
fileprivate extension NameWalletView {
    var primaryButtonView: some View {
        Button {
            model.onPrimaryCTATapped(text: text)
        } label: {
            PrimaryButtonView(text: model.content.primaryCTA)
                .foregroundColor(colorTheme.accent)
                .background(colorTheme.background2)
                .cornerRadius(ViewAttributes.cornerRadius)
        }
        .buttonStyle(.plain)
    }
}

import SwiftUI

struct SelectMnemonicEntropySecurityView: View {
    @Environment(\.colorTheme) private var colorTheme
    @Environment(\.hasBottomSafeAreaInsets) private var hasBottomSafeAreaInsets

    @StateObject var model: SelectMnemonicEntropySecurityViewModel

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
                mnemonicWordCountsList
            }
        }
        .cornerRadius(ViewAttributes.cornerRadius)
        .padding()
        .background(colorTheme.background)
        .navigationTitle("")
        .safeAreaInset(edge: .bottom, spacing: .zero) {
            VStack(spacing: .zero) {
                VerticalSpacer(height: .medium2)
                primaryButtonView
                if !hasBottomSafeAreaInsets {
                    VerticalSpacer(height: .medium)
                }
            }
        }
    }
}

// MARK: - Helpers
fileprivate extension SelectMnemonicEntropySecurityView {
    var mnemonicWordCountsList: some View {
        VStack(spacing: .zero) {
            ForEach(model.mnemonicWordCounts, id: \.index) { mnemonicWordCount in
                let isSelected = model.isMnemonicWordCountSelected(index: mnemonicWordCount.index)
                let displaySeparator = model.displaySeparator(mnemonicWordCountIndex: mnemonicWordCount.index)
                HStack(spacing: .zero) {
                    BodyText(model.content.mnemonicWordCount(mnemonicWordCount))
                        .foregroundColor(isSelected ? colorTheme.label : colorTheme.label2)
                    Spacer()
                    if isSelected {
                        Image(systemName: "checkmark")
                            .font(.body)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .foregroundColor(colorTheme.accent)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(isSelected ? colorTheme.background3 : .clear)
                .contentShape(Rectangle())
                .onTapGesture {
                    model.selectMnemonicWordCount(mnemonicWordCount)
                }
                Divider()
                    .overlay(displaySeparator ? colorTheme.separator : colorTheme.background2)
                    .padding(.leading)
            }
        }
        .background(colorTheme.background2)
        .cornerRadius(ViewAttributes.cornerRadius)
    }
}

// MARK: - Connections
fileprivate extension SelectMnemonicEntropySecurityView {
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

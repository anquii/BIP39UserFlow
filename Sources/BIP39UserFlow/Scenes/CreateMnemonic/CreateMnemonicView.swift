import SwiftUI

struct CreateMnemonicView: View {
    @Environment(\.colorTheme) private var colorTheme
    @Environment(\.hasBottomSafeAreaInsets) private var hasBottomSafeAreaInsets

    @StateObject var model: CreateMnemonicViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: .zero) {
                VerticalSpacer(height: .medium)
                Group {
                    TitleText(model.content.title)
                        .foregroundColor(colorTheme.label)
                    VerticalSpacer(height: .medium2)
                    BodyText(model.content.body(mnemonicWordCount: model.mnemonicWordCount))
                        .foregroundColor(colorTheme.label2)
                }
                VerticalSpacer(height: .large2)
                mnemonicWordsList
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
                    .disabled(!model.hasHighlightedListItems)
                if !hasBottomSafeAreaInsets {
                    VerticalSpacer(height: .medium)
                }
            }
        }
    }
}

// MARK: - Helpers
fileprivate extension CreateMnemonicView {
    var mnemonicWordsList: some View {
        VStack(spacing: .zero) {
            ForEach(model.listItems, id: \.index) { item in
                let isHighlighted = model.isListItemHighlighted(index: item.index)
                let displaySeparator = model.displaySeparator(listItemIndex: item.index)
                HStack(spacing: .zero) {
                    BodyText(String(item.mnemonicWord.index))
                        .foregroundColor(isHighlighted ? colorTheme.label : colorTheme.label2)
                    Spacer()
                    BodyText(isHighlighted ? item.mnemonicWord.value : item.randomLengthText)
                        .foregroundColor(isHighlighted ? colorTheme.label : .clear)
                        .background(colorTheme.background3)
                        .cornerRadius(2)
                }
                .textSelection(.disabled)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isHighlighted ? colorTheme.background3 : .clear)
                .contentShape(Rectangle())
                .onTapGesture {
                    model.highlightListItem(item)
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
fileprivate extension CreateMnemonicView {
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

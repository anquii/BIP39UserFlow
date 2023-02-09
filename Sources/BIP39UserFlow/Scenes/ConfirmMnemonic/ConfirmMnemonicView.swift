import SwiftUI

struct ConfirmMnemonicView: View {
    @Environment(\.colorTheme) private var colorTheme
    @Environment(\.hasBottomSafeAreaInsets) private var hasBottomSafeAreaInsets

    @StateObject var model: ConfirmMnemonicViewModel

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
                    .disabled(!model.areMenuItemSelectionsValid)
                if !hasBottomSafeAreaInsets {
                    VerticalSpacer(height: .medium)
                }
            }
        }
    }
}

// MARK: - Helpers
fileprivate extension ConfirmMnemonicView {
    var mnemonicWordsList: some View {
        VStack(alignment: .leading, spacing: .zero) {
            ForEach(model.listItems, id: \.index) { item in
                let isHighlighted = model.isListItemHighlighted(index: item.index)
                let displaySeparator = model.displaySeparator(listItemIndex: item.index)
                HStack(spacing: .zero) {
                    BodyText(model.content.mnemonicWord(index: item.mnemonicWord.index))
                        .foregroundColor(isHighlighted ? colorTheme.label : colorTheme.label2)
                    Spacer()
                    if isHighlighted {
                        mnemonicWordMenu(listItemIndex: item.index)
                            .frame(width: 100)
                            .foregroundColor(colorTheme.accent)
                    } else {
                        mnemonicWordSelectionView(text: item.randomLengthText)
                            .foregroundColor(.clear)
                            .background(colorTheme.background3)
                            .cornerRadius(2)
                    }
                }
                .textSelection(.disabled)
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

    func mnemonicWordMenu(listItemIndex: Int) -> some View {
        Menu {
            ForEach(model.menuItems) { item in
                Button(item.value) {
                    model.selectMenuItem(item, listItemIndex: listItemIndex)
                }
                .buttonStyle(.plain)
            }
        } label: {
            HStack(spacing: .zero) {
                Spacer()
                mnemonicWordSelectionView(text: model.selectedMenuItemText(listItemIndex: listItemIndex))
            }
        }
    }
}

// MARK: - Helpers
fileprivate extension ConfirmMnemonicView {
    func mnemonicWordSelectionView(text: String) -> some View {
        HStack(spacing: .zero) {
            BodyText(text)
            HorizontalSpacer(width: 3)
            Image(systemName: "chevron.up.chevron.down")
                .font(.footnote)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
        }
    }
}

// MARK: - Connections
fileprivate extension ConfirmMnemonicView {
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

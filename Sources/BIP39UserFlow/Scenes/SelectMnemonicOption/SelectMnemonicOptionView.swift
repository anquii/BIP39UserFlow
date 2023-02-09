import SwiftUI

struct SelectMnemonicOptionView: View {
    @Environment(\.colorTheme) private var colorTheme

    @State var model: SelectMnemonicOptionViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: .zero) {
                VerticalSpacer(height: .medium)
                Group {
                    TitleText(model.content.title)
                        .foregroundColor(colorTheme.label)
                    VerticalSpacer(height: .medium2)
                    BodyText(model.body)
                        .foregroundColor(colorTheme.label2)
                }
                .padding(.horizontal)
                VerticalSpacer(height: .veryLarge)
                VStack(spacing: .zero) {
                    if model.showCreateMnemonicOption {
                        createMnemonicOptionView
                            .simultaneousGesture(TapGesture().onEnded {
                                model.onCreateMnemonicOptionTapped()
                            })
                    }
                    if model.showCreateMnemonicOption, model.showImportMnemonicOption {
                        Divider()
                            .overlay(colorTheme.separator)
                            .padding(.leading)
                    }
                    if model.showImportMnemonicOption {
                        importMnemonicOptionView
                    }
                }
                .background(colorTheme.background2)
                .cornerRadius(ViewAttributes.cornerRadius)
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
        .background(colorTheme.background)
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                leadingNavigationBarButtonView
            }
        }
    }
}

// MARK: - Helpers
fileprivate extension SelectMnemonicOptionView {
    var leadingNavigationBarButtonView: some View {
        Button {
            model.onLeadingNavigationBarButtonTapped()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
                .foregroundColor(colorTheme.fill)
        }
        .buttonStyle(.plain)
    }

    func mnemonicOptionView(headline: String, subheadline: String) -> some View {
        HStack(spacing: .zero) {
            VStack(alignment: .leading, spacing: .zero) {
                VerticalSpacer(height: .medium)
                HeadlineText(headline)
                    .foregroundColor(colorTheme.label)
                VerticalSpacer(height: .verySmall)
                SubheadlineText(subheadline)
                    .foregroundColor(colorTheme.label2)
                VerticalSpacer(height: .medium)
            }
            .padding(.trailing)
            Spacer()
            Image(systemName: "chevron.forward")
                .font(.headline)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
                .foregroundColor(colorTheme.fill)
        }
        .padding(.horizontal)
        .buttonStyle(.plain)
    }
}

// MARK: - Connections
fileprivate extension SelectMnemonicOptionView {
    var createMnemonicOptionView: some View {
        let connection = WireframeConnection {
            mnemonicOptionView(headline: model.content.createMnemonicHeadline, subheadline: model.content.createMnemonicSubheadline)
        }
        return model.createMnemonicWireframeContent.view(connection: connection)
    }

    var importMnemonicOptionView: some View {
        let connection = WireframeConnection {
            mnemonicOptionView(headline: model.content.importMnemonicHeadline, subheadline: model.content.importMnemonicSubheadline)
        }
        return model.importMnemonicWireframeContent.view(connection: connection)
    }
}

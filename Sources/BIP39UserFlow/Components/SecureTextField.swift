import SwiftUI

struct SecureTextField: View {
    @Environment(\.colorTheme) private var colorTheme

    @Binding var text: String
    @State private var showText = false
    let placeholderText: String

    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            HStack(spacing: .zero) {
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        BodyText(placeholderText)
                            .foregroundColor(colorTheme.label3)
                    }
                    SecureField("", text: $text)
                        .font(.body)
                        .fontWeight(.regular)
                        .fontDesign(.rounded)
                        .foregroundColor(colorTheme.label2)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
                Spacer()
                Button {
                    withAnimation {
                        showText.toggle()
                    }
                } label: {
                    Image(systemName: showText ? "eye.slash.fill" : "eye.fill")
                        .font(.body)
                        .fontWeight(.regular)
                        .fontDesign(.rounded)
                        .foregroundColor(colorTheme.fill)
                        .padding(.leading, 5)
                }
                .buttonStyle(.plain)
            }
            .frame(height: 20)
            .padding()
            if showText {
                Divider()
                    .overlay(colorTheme.separator)
                    .padding(.leading)
                BodyText(text)
                    .frame(minHeight: 20)
                    .padding()
                    .foregroundColor(colorTheme.label2)
            }
        }
        .background(colorTheme.background2)
        .cornerRadius(ViewAttributes.cornerRadius)
   }
}

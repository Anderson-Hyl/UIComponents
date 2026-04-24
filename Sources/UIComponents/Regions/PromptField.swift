import SwiftUI

public struct PromptField: View {
    @Environment(\.theme) private var theme
    @Binding private var text: String
    private let placeholder: String
    private let onSend: () -> Void

    public init(
        text: Binding<String>,
        placeholder: String = "",
        onSend: @escaping () -> Void = {}
    ) {
        self._text = text
        self.placeholder = placeholder
        self.onSend = onSend
    }

    public var body: some View {
        HStack(spacing: 10) {
            TextField(
                "",
                text: $text,
                prompt: Text(placeholder)
                    .foregroundStyle(theme.colors.primaryText.opacity(0.4))
            )
            .textStyle(theme.typography.drawerInput)
            .foregroundStyle(theme.colors.primaryText)
            .textFieldStyle(.plain)
            .onSubmit(onSend)

            PrimaryButton("Send", action: onSend)
        }
        .padding(.vertical, 9)
        .padding(.horizontal, 14)
        .background(
            RoundedRectangle(cornerRadius: theme.radius.inputChip, style: .continuous)
                .fill(Color(light: 0xFFFFFF, dark: 0x161616))
        )
        .innerStroke(
            Color(light: 0xDDDBD6, dark: 0x242424),
            cornerRadius: theme.radius.inputChip
        )
    }
}

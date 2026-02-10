//
//  SupportChatView.swift
//  SampleWorkshopApp
//
//  Created by Arnold Noronha on 2/9/26.
//

import SwiftUI
import DesignSystem
import Prefire

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isFromSupport: Bool
}

struct SupportChatView: View {
    @State private var messageText = ""
    let messages: [ChatMessage]

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Circle()
                    .fill(.green)
                    .frame(width: 8, height: 8)
                Text("Support")
                    .fontWeight(.semibold)
                Spacer()
                Text("Online")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(AppTheme.cardBackground)

            // Messages
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(messages) { message in
                        messageBubble(message)
                    }
                }
                .padding()
            }

            // Input bar
            HStack(spacing: 12) {
                TextField("Type a message...", text: $messageText)
                    .padding(10)
                    .background(AppTheme.cardBackground)
                    .cornerRadius(20)

                Button {} label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.title)
                        .foregroundStyle(AppTheme.accentGradient)
                }
            }
            .padding()
        }
    }

    private func messageBubble(_ message: ChatMessage) -> some View {
        HStack {
            if !message.isFromSupport { Spacer(minLength: 60) }

            VStack(alignment: message.isFromSupport ? .leading : .trailing, spacing: 4) {
                Text(message.text)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(message.isFromSupport ? AppTheme.cardBackground : Color.indigo)
                    .foregroundColor(message.isFromSupport ? .primary : .white)
                    .cornerRadius(AppTheme.cornerRadius)

                Text(currentTimestamp)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }

            if message.isFromSupport { Spacer(minLength: 60) }
        }
    }

    private var currentTimestamp: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: Date())
    }
}

extension SupportChatView {
    static let sampleMessages: [ChatMessage] = [
        ChatMessage(text: "Hi! I'm having trouble resetting my password.", isFromSupport: false),
        ChatMessage(text: "Hello! I'd be happy to help you with that. Can you tell me the email address associated with your account?", isFromSupport: true),
        ChatMessage(text: "Sure, it's john@example.com", isFromSupport: false),
        ChatMessage(text: "Thanks! I've sent a password reset link to that email. It should arrive within a few minutes.", isFromSupport: true),
        ChatMessage(text: "Got it, thank you so much!", isFromSupport: false),
        ChatMessage(text: "You're welcome! Let me know if you need anything else. 😊", isFromSupport: true),
    ]
}

#Preview("SupportChatView_Light") {
    SupportChatView(messages: SupportChatView.sampleMessages)
        .preferredColorScheme(.light)
        .prefireIgnored()
}

#Preview {
    SupportChatView(messages: SupportChatView.sampleMessages)
        .preferredColorScheme(.dark)
        .prefireIgnored()
}

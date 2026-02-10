//
//  AboutView.swift
//  SampleWorkshopApp
//
//  Created by Arnold Noronha on 2/9/26.
// See https://github.com/pointfreeco/swift-snapshot-testing/issues/667

import SwiftUI
import DesignSystem

struct AboutView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    VStack(spacing: 8) {
                        Image(systemName: "bubble.left.and.bubble.right.fill")
                            .font(.system(size: 50))
                            .foregroundStyle(AppTheme.accentGradient)
                        Text("SampleWorkshopApp")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Version 1.0.0 (42)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 12)
                    Spacer()
                }
            }

            Section("General") {
                Label("Rate this App", systemImage: "star.fill")
                Label("Share with Friends", systemImage: "square.and.arrow.up")
                Label("Help & Support", systemImage: "questionmark.circle")
            }

            Section("Team") {
                teamRow(name: "Alice Johnson", role: "Engineering Lead")
                teamRow(name: "Bob Chen", role: "Designer")
                teamRow(name: "Carol Williams", role: "Backend Engineer")
                teamRow(name: "David Kim", role: "QA Engineer")
            }

            Section("Legal") {
                Label("Terms of Service", systemImage: "doc.text")
                Label("Privacy Policy", systemImage: "lock.shield")
                Label("Open Source Licenses", systemImage: "chevron.left.forwardslash.chevron.right")
            }

            Section {
                HStack {
                    Spacer()
                    Text("Made with ❤️ in San Francisco")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    Spacer()
                }
            }
        }
        .navigationTitle("About")
    }

    private func teamRow(name: String, role: String) -> some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .font(.title2)
                .foregroundStyle(.secondary)
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.medium)
                Text(role)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview("Light_AboutView") {
    NavigationStack {
        AboutView()
    }
    .preferredColorScheme(.light)
}

#Preview("Dark_AboutView") {
    NavigationStack {
        AboutView()
    }
    .preferredColorScheme(.dark)
}

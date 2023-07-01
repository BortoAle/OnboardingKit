// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct WelcomeView: View {
    
    @AppStorage("showWelcomeView") var showWelcomeView: Bool = true
    
    let title: LocalizedStringKey
    let rows: [WelcomeRow]

    public var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Spacer()
                ScrollView {
                    VStack(spacing: 24) {
                        ForEach(rows, id: \.id) { row in
                            row
                        }
                    }
                }
                .scrollBounceBehavior(.basedOnSize)
            Button(action: {
                showWelcomeView = false
            }, label: {
                Text("Continue")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
            })
            .buttonBorderShape(.roundedRectangle(radius: 16))
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(32)
    }
}

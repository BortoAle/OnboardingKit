// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct OnboardingView: View {
    
    @AppStorage("showWelcomeView") var showWelcomeView: Bool = true
    
    let title: LocalizedStringKey
    let rows: [OnboardingRow]

    public var body: some View {
        VStack(spacing: 32) {
					Spacer(minLength: 0)
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
								.padding(24)
                ScrollView {
									VStack(alignment: .leading, spacing: 32) {
                        ForEach(rows, id: \.id) { row in
                            row
                        }
                    }
									.padding(24)
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
						.padding(24)
        }
    }
}

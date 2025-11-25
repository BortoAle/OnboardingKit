//
//  OnboardingUI.swift
//  
//
//  Created by Alessandro Bortoluzzi on 09/10/23.
//

import SwiftUI

public struct OnboardingUI: View {

	@State var isOnboarding: Bool = true

	public var body: some View {
		Text("Hello, world!")
			.welcomeSheet(
				isPresented: $isOnboarding,
				onDismiss: {
					isOnboarding = false
				},
				rows: [
					OnboardingRow(
						image: Image(systemName: "shippingbox.fill"),
						style: .pink,
						title: "Ready-to-Use Components",
						description: "Drop in pre-built SwiftUI views to create beautiful onboarding flows in minutes."
					),
					OnboardingRow(
						image: Image(systemName: "slider.horizontal.3"),
						style: .yellow,
						title: "Fully Customizable",
						description: "Style each row with custom icons, colors, titles, and descriptions to match your app."
					),
					OnboardingRow(
						image: Image(systemName: "swift"),
						style: .brown,
						title: "Swift Package Manager",
						description: "Easily integrate into any project with just a few clicks using SPM."
					)
				],
				title: "Welcome to OnboardingKit",
				actionTitle: "Get Started",
				onConfirm: {
					isOnboarding = false
				}
			)
	}
}

#Preview {
	OnboardingUI()
}

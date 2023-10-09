//
//  OnboardingRow.swift
//
//
//  Created by Alessandro Bortoluzzi on 23/06/23.
//

import SwiftUI

/// A view representing a single onboarding row.
///
/// An `OnboardingRow` is used within the onboarding sheet to display a piece of onboarding information, typically consisting of an image, a title, and a description.
///
/// - Parameters:
///   - image: An `Image` representing an icon or visual element for the onboarding row.
///   - title: A `LocalizedStringKey` representing the title or heading of the onboarding row.
///   - description: A `LocalizedStringKey` representing the detailed description of the onboarding row.
///
/// - Note: This view is typically used as a building block within the `OnboardingView` to create a series of onboarding steps.
///
/// Example Usage:
///
/// ```swift
/// OnboardingRow(image: Image(systemName: "star.circle.fill"), title: "Welcome", description: "Welcome to our app.")
/// ```
///
/// The `OnboardingRow` view can be customized by providing different images, titles, and descriptions to suit the specific onboarding content of your application.
public struct OnboardingRow: View {
	
	let id = UUID()
	let image: Image
	let title: LocalizedStringKey
	let description: LocalizedStringKey
	
	public init(image: Image, title: LocalizedStringKey, description: LocalizedStringKey) {
		self.image = image
		self.title = title
		self.description = description
	}
	
	public var body: some View {
		HStack(spacing: 24) {
			image
				.font(.title)
				.frame(width: 32)
			VStack(alignment: .leading, spacing: 2) {
				Text(title)
					.font(.headline)
					.lineLimit(2)
				Text(description)
					.font(.subheadline)
					.foregroundStyle(.secondary)
			}
		}
	}
}

#Preview {
	OnboardingRow(image: Image(systemName: "xmark"), title: "Delete", description: "Delete things")
}

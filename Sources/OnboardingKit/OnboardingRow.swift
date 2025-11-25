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
///   - isProFeature: A `Bool` indicating whether to display a "Pro" badge next to the title. Defaults to `false`.
///   - image: An `Image` representing an icon or visual element for the onboarding row.
///   - style: A `Color` to apply to the image for the onboarding row.
///   - title: A `LocalizedStringKey` representing the title or heading of the onboarding row.
///   - description: A `LocalizedStringKey` representing the detailed description of the onboarding row.
///
/// - Note: This view is typically used as a building block within the `OnboardingView` to create a series of onboarding steps.
///
/// Example Usage:
///
/// ```swift
/// OnboardingRow(image: Image(systemName: "star.circle.fill"), style: .yellow, title: "Welcome", description: "Welcome to our app.")
/// ```
///
/// The `OnboardingRow` view can be customized by providing different images, styles, titles, and descriptions to suit the specific onboarding content of your application.
public struct OnboardingRow: View {
	@ScaledMetric private var imageSize = 32

	let id = UUID()
	let isProFeature: Bool
	let image: Image
	let style: Color
	let title: LocalizedStringKey
	let description: LocalizedStringKey

	public init(
		isProFeature: Bool = false,
		image: Image,
		style: Color,
		title: LocalizedStringKey,
		description: LocalizedStringKey
	) {
		self.isProFeature = isProFeature
		self.image = image
		self.style = style
		self.title = title
		self.description = description
	}

	public var body: some View {
		HStack(spacing: 24) {
			image
				.font(.title)
				.frame(width: imageSize)
				.symbolRenderingMode(.multicolor)
				.foregroundStyle(style)

			VStack(alignment: .leading, spacing: 2) {
				HStack {
					Text(title)
						.font(.headline)
						.lineLimit(2)

					if isProFeature {
						Text("Pro")
							.foregroundStyle(.white)
							.font(.caption2)
							.fontWeight(.semibold)
							.padding(.vertical, 4)
							.padding(.horizontal, 8)
							.background(.blue.gradient, in: .capsule)
					}
				}

				Text(description)
					.font(.subheadline)
					.foregroundStyle(.secondary)
			}
		}
	}
}

#Preview {
	OnboardingRow(image: Image(systemName: "xmark"), style: .blue, title: "Delete", description: "Delete things")
}

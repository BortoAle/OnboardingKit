//
//  OnboardingUI.swift
//
//
//  Created by Alessandro Bortoluzzi on 23/06/23.
//

import SwiftUI

/// A view representing a full onboarding experience.
///
/// An `OnboardingView` displays a title, a scrollable list of onboarding rows, and one or two action buttons. Use this view directly when you need more control over presentation, or use the `.welcomeSheet` modifier for a simpler approach.
///
/// - Parameters:
///   - title: A `LocalizedStringKey` representing the main title displayed at the top of the onboarding view.
///   - rows: An array of `OnboardingRow` views to be displayed within the onboarding view.
///   - actionTitle: A `LocalizedStringKey` representing the label for the primary action button.
///   - action: A closure to be executed when the primary action button is tapped.
///   - secondaryActionTitle: An optional `LocalizedStringKey` representing the label for a secondary action button.
///   - secondaryAction: An optional closure to be executed when the secondary action button is tapped.
///
/// Example Usage:
///
/// ```swift
/// OnboardingView(
///     title: "Welcome to Our App",
///     rows: [
///         OnboardingRow(image: Image(systemName: "hand.wave.fill"), style: .orange, title: "Welcome", description: "Get a warm welcome."),
///         OnboardingRow(image: Image(systemName: "star.fill"), style: .yellow, title: "Features", description: "Discover amazing features.")
///     ],
///     actionTitle: "Get Started",
///     action: {
///         // Handle primary action
///     },
///     secondaryActionTitle: "Learn More",
///     secondaryAction: {
///         // Handle secondary action
///     }
/// )
/// ```
public struct OnboardingView: View {
	let title: LocalizedStringKey
	let rows: [OnboardingRow]
	let actionTitle: LocalizedStringKey
	let action: () -> Void
	let secondaryActionTitle: LocalizedStringKey?
	let secondaryAction: (() -> Void)?

	public init(
		title: LocalizedStringKey,
		rows: [OnboardingRow],
		actionTitle: LocalizedStringKey,
		action: @escaping () -> Void,
		secondaryActionTitle: LocalizedStringKey?,
		secondaryAction: (() -> Void)?
	) {
		self.title = title
		self.rows = rows
		self.actionTitle = actionTitle
		self.action = action
		self.secondaryActionTitle = secondaryActionTitle
		self.secondaryAction = secondaryAction
	}

	public var body: some View {
		VStack(alignment: .leading, spacing: 32) {
			Text(title)
				.font(.title2)
				.fontWeight(.bold)
				.multilineTextAlignment(.leading)
				.lineLimit(3)
				.padding(.horizontal, 32)
				.padding(.top, 64)

			ScrollView {
				VStack(alignment: .leading, spacing: 32) {
					ForEach(rows, id: \.id) { row in
						row
					}
				}
			}
			.scrollBounceBehavior(.basedOnSize)
			.contentMargins(32, for: .scrollContent)

			VStack(spacing: 12) {
				if let secondaryAction {
					Button(action: secondaryAction) {
						Text(secondaryActionTitle ?? "")
							.font(.headline)
							.frame(maxWidth: .infinity)
							.padding(.vertical, 8)
					}
					.buttonStyle(.glass)
				}

				Button(action: action) {
					Text(actionTitle)
						.font(.headline)
						.frame(maxWidth: .infinity)
						.padding(.vertical, 8)
				}
				.buttonStyle(.glassProminent)
			}
			.padding(.horizontal, 32)
		}
	}
}

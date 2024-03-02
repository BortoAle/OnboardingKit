//
//  OnboardingUI.swift
//
//
//  Created by Alessandro Bortoluzzi on 23/06/23.
//

import SwiftUI

public struct OnboardingView: View {
	
	let title: LocalizedStringResource
	let rows: [OnboardingRow]
	let action: () -> Void
	
	public var body: some View {
		VStack(spacing: 32) {
			Spacer(minLength: 0)
			Text(title)
				.font(.largeTitle)
				.fontWeight(.bold)
				.multilineTextAlignment(.center)
				.lineLimit(3)
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
			Button(action: action) {
				Text("Continue")
					.font(.headline)
					.frame(maxWidth: .infinity)
					.padding(.vertical, 8)
			}
			.buttonBorderShape(.roundedRectangle(radius: 16))
			.buttonStyle(.borderedProminent)
			.padding(24)
		}
	}
}

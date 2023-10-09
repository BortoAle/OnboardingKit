//
//  SwiftUIView.swift
//
//
//  Created by Alessandro Bortoluzzi on 23/06/23.
//

import SwiftUI

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

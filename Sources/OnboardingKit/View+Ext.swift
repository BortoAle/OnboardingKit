//
//  View+Ext.swift
//  
//
//  Created by Alessandro Bortoluzzi on 23/06/23.
//

import SwiftUI

extension View {
    
	/// Presents a custom welcome sheet.
	///
	/// This function allows you to display a custom welcome sheet to the user, with a series of onboarding rows.
	///
	/// - Parameters:
	///   - isPresented: A binding to a boolean that determines whether the welcome sheet should be shown or hidden.
	///   - onDismiss: A closure to be executed when the welcome sheet is dismissed.
	///   - rows: An array of `OnboardingRow` views to be displayed within the welcome sheet.
	///   - title: A `LocalizedStringKey` representing the title of the welcome sheet.
	///   - actionTitle: A `LocalizedStringKey` representing the label for the primary action button.
	///   - onConfirm: A closure to be executed when the primary action button is tapped.
	///   - secondaryActionTitle: An optional `LocalizedStringKey` representing the label for a secondary action button.
	///   - onSecondaryConfirm: An optional closure to be executed when the secondary action button is tapped.
	///
	/// - Returns: A view with the welcome sheet modifier applied.
	///
	/// Example Usage:
	///
	/// ```swift
	/// @AppStorage("isWelcomeSheetPresented") var isWelcomeSheetPresented = true
	///
	/// var body: some View {
	///     ContentView()
	///         .welcomeSheet(
	///             isPresented: $isWelcomeSheetPresented,
	///             onDismiss: {
	///                 // Perform actions on dismiss
	///             },
	///             rows: [
	///                 OnboardingRow(image: Image(systemName: "hand.wave.fill"), style: .orange, title: "Welcome", description: "Get a warm welcome.")
	///             ],
	///             title: "Welcome to Our App",
	///             actionTitle: "Get Started",
	///             onConfirm: {
	///                 isWelcomeSheetPresented = false
	///             }
	///         )
	/// }
	/// ```
	///
	/// You can use the `@AppStorage` property wrapper to persist the state of the welcome sheet presentation.
	public func welcomeSheet(
		isPresented: Binding<Bool>,
		onDismiss: (() -> Void)?,
		rows: [OnboardingRow],
		title: LocalizedStringKey,
		actionTitle: LocalizedStringKey,
		onConfirm: @escaping () -> Void,
		secondaryActionTitle: LocalizedStringKey? = nil,
		onSecondaryConfirm: (() -> Void)? = nil
	) -> some View {
         self.sheet(
			isPresented: isPresented,
			onDismiss: onDismiss) {
					 OnboardingView(
						title: title,
						rows: rows,
						actionTitle: actionTitle,
						action: onConfirm,
						secondaryActionTitle: secondaryActionTitle,
						secondaryAction: onSecondaryConfirm
					 )
        }
    }
    
}

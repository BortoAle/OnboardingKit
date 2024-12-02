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
	///   - isPresented: A boolean variable that determines whether the welcome sheet should be shown or hidden.
	///   - onDismiss: A closure to be executed when the welcome sheet is dismissed.
	///   - rows: An array of onboarding rows to be displayed within the welcome sheet.
	///   - title: The title of the welcome sheet.
	///
	/// - Returns: A view representing the welcome sheet.
	///
	/// - Note: This function is useful for providing introductory guidance to the user when they first launch the application.
	///
	/// Example Usage:
	///
	/// ```swift
	/// @AppStorage("isWelcomeSheetPresented") var isWelcomeSheetPresented = true
	///
	/// var body: some View {
	///     welcomeSheet(isPresented: $isWelcomeSheetPresented, onDismiss: {
	///         // Perform actions
	///     })
	/// }
	/// ```
	///
	/// You can use the `@AppStorage` property wrapper to store and retrieve the state of `isWelcomeSheetPresented` if needed to show the welcome view conditionally.
	public func welcomeSheet(
		isPresented: Binding<Bool>,
		onDismiss: (() -> Void)?,
		rows: [OnboardingRow],
		title: LocalizedStringKey,
		actionTitle: LocalizedStringKey,
		onConfirm: @escaping () -> Void
	) -> some View {
         self.sheet(
			isPresented: isPresented,
			onDismiss: onDismiss) {
					 OnboardingView(
						title: title,
						rows: rows,
						actionTitle: actionTitle,
						action: onConfirm
					 )
        }
    }
    
}

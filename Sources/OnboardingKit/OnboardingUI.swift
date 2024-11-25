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
			.welcomeSheet(isPresented: $isOnboarding, onDismiss: {
				isOnboarding = false
			}, rows: [
					OnboardingRow(image: Image(systemName: "hand.wave.fill"), title: "Saluti cordiali", description: "Dai un caloroso benvenuto all'app."),
					OnboardingRow(image: Image(systemName: "lightbulb.fill"), title: "Illumina la tua esperienza", description: "Scopri funzioni innovative che risolveranno i tuoi problemi."),
					OnboardingRow(image: Image(systemName: "wrench.fill"), title: "Personalizza al massimo", description: "Adatta l'app alle tue preferenze per un'esperienza unica.")
			], title: "Benvenuto su Imaginaria", actionTitle: "Continue", onConfirm: {
				isOnboarding = false
			})

    }
}

#Preview {
	OnboardingUI()
}

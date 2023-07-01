//
//  SwiftUIView.swift
//  
//
//  Created by Alessandro Bortoluzzi on 23/06/23.
//

import SwiftUI

extension View {
    
    public func welcomeSheet(isPresented: Binding<Bool>, onDismiss: (() -> Void)?, rows: [WelcomeRow], title: LocalizedStringKey) -> some View {
         self.sheet(isPresented: isPresented, onDismiss: onDismiss) {
             WelcomeView(title: title, rows: rows)
        }
    }
    
}

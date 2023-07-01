//
//  SwiftUIView.swift
//  
//
//  Created by Alessandro Bortoluzzi on 23/06/23.
//

import SwiftUI

public struct WelcomeRow: View {
    
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
                   VStack(alignment: .leading, spacing: 2) {
                       Text(title)
                           .font(.subheadline)
                           .bold()
                       Text(description)
                           .font(.subheadline)
                           .foregroundStyle(.secondary)
                   }
               }
    }
}

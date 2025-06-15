//
//  SwiftUIView.swift
//  PersonInitialsAvatar
//
//  Created by Ivan Bondaruk on 15/06/2025.
//

import SwiftUI

public struct ProfessionalPersonInitialAvatarView: View {
    let fullName: String
    let diameter: CGFloat
    let gradientColors: [Color]
    
    public init(fullName: String, diameter: CGFloat, gradientColors: [Color] = [.pink, .purple]) {
        self.fullName = fullName
        self.diameter = diameter
        self.gradientColors = gradientColors
    }

    private var initials: String {
        fullName
            .split(separator: " ")
            .compactMap { $0.first }
            .prefix(2)
            .map { String($0) }
            .joined()
            .uppercased()
    }
    
    public var bgGradient: LinearGradient {
        LinearGradient(
            colors: gradientColors,
            startPoint: .leading,
            endPoint: .trailing
        )
    }

    public var body: some View {
        Text(initials)
            .font(.system(size: diameter / 2.5, weight: .bold))
            .foregroundColor(.white)
            .frame(width: diameter, height: diameter)
            .background(
                Circle().fill(bgGradient)
            )
    }
}

#Preview {
    ProfessionalPersonInitialAvatarView(fullName: "Ivan Bondaruk", diameter: 100)
}

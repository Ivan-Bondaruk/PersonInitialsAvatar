// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct PersonInitialsAvatarView: View {
    let fullName: String
    let diameter: CGFloat
    let backgroundColor: Color
    
    init(fullName: String, diameter: CGFloat, backgroundColor: Color = .blue) {
        self.fullName = fullName
        self.diameter = diameter
        self.backgroundColor = backgroundColor
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

    public var body: some View {
        Text(initials)
            .font(.system(size: diameter / 2.5, weight: .bold))
            .foregroundColor(.white)
            .frame(width: diameter, height: diameter)
            .background(Circle().fill(backgroundColor))
    }
}

#Preview {
    PersonInitialsAvatarView(fullName: "Ivan Bondaruk", diameter: 100, backgroundColor: .secondary)
}

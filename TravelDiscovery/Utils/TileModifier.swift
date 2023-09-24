//
//  TileModifier.swift
//  TravelDiscovery
//
//  Created by joe on 2023/09/25.
//

import SwiftUI

extension View {
    func asTile() -> some View {
        modifier(TileModifier())
    }
}

struct TileModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: Color(.sRGB, white: 0.8, opacity: 1), radius: 4, x: 0.0, y: 2)
    }
}

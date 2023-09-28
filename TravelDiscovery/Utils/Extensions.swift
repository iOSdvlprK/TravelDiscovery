//
//  Extensions.swift
//  TravelDiscovery
//
//  Created by joe on 2023/09/28.
//

import SwiftUI

extension View {
    func navigationBarInitialization() {
        // https://stackoverflow.com/a/74369067/4999901
        let coloredAppearance = UINavigationBarAppearance()
        //        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
    }
    
    func navBarInit() -> some View {
        modifier(NavBarInit())
    }
}

struct NavBarInit: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbarBackground(Color.clear, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}

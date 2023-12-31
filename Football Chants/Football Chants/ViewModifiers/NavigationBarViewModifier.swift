//
//  NavigationBarViewModifier.swift
//  Football Chants
//
//  Created by Bambang Tri Rahmat Doni on 11/12/23.
//

import SwiftUI

struct NavigationBarViewModifier: ViewModifier {

    var backgroundColor: UIColor?
    var titleColor: UIColor?

    init(backgroundColor: Color?, titleColor: UIColor?) {
        self.backgroundColor = UIColor(backgroundColor ?? .clear)
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithDefaultBackground()
        coloredAppearance.backgroundColor = UIColor(backgroundColor ?? .accentColor)
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .black]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .black]
        coloredAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = titleColor
    }

    func body(content: Content) -> some View { return content }
}

extension View {
    func navigationBarColor(backgroundColor: Color? = nil, titleColor: UIColor? = nil) -> some View {
        self.modifier(NavigationBarViewModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }

}



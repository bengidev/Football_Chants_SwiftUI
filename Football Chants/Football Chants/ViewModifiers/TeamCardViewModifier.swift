//
//  TeamCardViewModifier.swift
//  Football Chants
//
//  Created by Bambang Tri Rahmat Doni on 11/12/23.
//

import SwiftUI

struct TeamCardViewModifier: ViewModifier {
    let teamType: TeamType
    
    func body(content: Content) -> some View {
        content
            .padding(10.0)
            .background(self.teamType.background)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            .padding(.vertical, 10.0)
            .shadow(radius: 10.0)
    }
}

extension View {
    func teamCard(_ teamType: TeamType) -> some View {
        return self.modifier(TeamCardViewModifier(teamType: teamType))
    }
}

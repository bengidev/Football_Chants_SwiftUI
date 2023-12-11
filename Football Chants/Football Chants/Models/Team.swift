//
//  Team.swift
//  Football Chants
//
//  Created by Bambang Tri Rahmat Doni on 11/12/23.
//

import Foundation

struct Team: Hashable, Identifiable {
    let id: TeamType
    let name: String
    let info: String
    let founded: String
    let manager: Manager
    var isPlayingChant: Bool = false
    
    static let empty: Team = .init(
        id: .manchesterUnited,
        name: "",
        info: "",
        founded: "",
        manager: .empty
    )
    
    mutating func toggleIsPlayingChant() -> Void {
        self.isPlayingChant.toggle()
    }
}

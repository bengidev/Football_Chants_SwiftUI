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
        name: "Manchester United",
        info: "Manchester United Football Club, commonly referred to as Man United (often stylised as Man Utd), or simply United, is a professional football club based in Old Trafford, Greater Manchester, England. The club competes in the Premier League, the top division in the English football league system. Nicknamed the Red Devils, they were founded as Newton Heath LYR Football Club in 1878, but changed their name to Manchester United in 1902. After a spell playing in Clayton, Manchester, the club moved to their current stadium, Old Trafford, in 1910.",
        founded: "1878",
        manager: .init(name: "Erik ten Hag", job: .manager)
    )
    
    mutating func toggleIsPlayingChant() -> Void {
        self.isPlayingChant.toggle()
    }
}

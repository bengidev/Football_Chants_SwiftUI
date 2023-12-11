//
//  Manager.swift
//  Football Chants
//
//  Created by Bambang Tri Rahmat Doni on 11/12/23.
//

import Foundation

struct Manager: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let job: Job
    
    static let empty: Manager = .init(name: "", job: .manager)
}

extension Manager {
    enum Job: Hashable, Identifiable, CaseIterable {
        var id: Self { return self }
        case manager
        case headCoach
    }
}

//
//  Football_ChantsApp.swift
//  Football Chants
//
//  Created by Bambang Tri Rahmat Doni on 11/12/23.
//

import SwiftUI

@main
struct Football_ChantsApp: App {
    @StateObject private var vm = TeamViewModel()
    var body: some Scene {
        WindowGroup {
            Group {
                TeamView()
            }
            .environmentObject(self.vm)
        }
    }
}

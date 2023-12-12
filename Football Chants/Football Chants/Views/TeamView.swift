//
//  TeamView.swift
//  Football Chants
//
//  Created by Bambang Tri Rahmat Doni on 11/12/23.
//

import SwiftUI

struct TeamView: View {
    @EnvironmentObject private var vm: TeamViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack {
                        ForEach(self.vm.teams) { team in
                            TeamCardView(team: team, delegate: self)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Football Chants")
            .navigationBarTitleDisplayMode(.large)
            .animation(.easeInOut, value: self.vm.teams)
        }
    }
}

#Preview {
    TeamView()
        .environmentObject(TeamViewModel())
}

extension TeamView: TeamDelegate {
    func completionHandler(_ team: Team) {
        self.vm.playChant(for: team)
    }
}

private extension TeamView {
    @ViewBuilder
    private func helloView() -> some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, Football Chants!")
        }
        .font(.headline)
        .padding()
        .background(Color.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .shadow(radius: 5.0)
    }
}


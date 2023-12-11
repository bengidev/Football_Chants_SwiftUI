//
//  TeamView.swift
//  Football Chants
//
//  Created by Bambang Tri Rahmat Doni on 11/12/23.
//

import SwiftUI

struct TeamView: View {
    let team: Team
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                
                List(0..<5) { item in
                    TeamCardView(team: .empty)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Football Chants")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    TeamView(team: .empty)
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


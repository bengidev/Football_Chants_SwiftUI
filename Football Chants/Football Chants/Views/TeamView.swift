//
//  TeamView.swift
//  Football Chants
//
//  Created by Bambang Tri Rahmat Doni on 11/12/23.
//

import SwiftUI

struct TeamView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.app
                    .ignoresSafeArea()
                
                VStack {
                    self.helloView()
                }
            }
            .navigationTitle("Football Chants")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarColor(backgroundColor: .app)
        }
    }
}

#Preview {
    TeamView()
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


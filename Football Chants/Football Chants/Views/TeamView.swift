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
                    HStack(alignment: .top) {
                        Image(self.team.id.badge)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                        
                        VStack(alignment: .leading) {
                            Text(self.team.name)
                                .font(.system(.title2, design: .rounded).bold())
                                .padding(.bottom, 10.0)
                            
                            Group {
                                Text("Founded: ") +
                                Text(self.team.founded)
                            }
                            .font(.headline.weight(.light).italic())
                            
                            Group {
                                Text("\(self.team.manager.job.rawValue): ") +
                                Text("\(self.team.manager.name):")
                            }
                            .font(.headline.weight(.light).italic())
                            .padding(.bottom, 5.0)
                            
                            Text(self.team.info)
                                .font(.footnote)
                        }
                        
                        Button {
                            //
                        } label: {
                            Image(systemName: "play.circle.fill")
                        }
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .frame(
                            maxWidth: 40.0,
                            maxHeight: .infinity,
                            alignment: .center
                        )
                    }
                    .padding(10.0)
                    .background(self.team.id.background)
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                }
                .listStyle(.plain)
            }
            .navigationTitle("Football Chants")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarColor(backgroundColor: Color.gray.opacity(0.2))
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


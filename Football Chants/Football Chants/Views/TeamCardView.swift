//
//  TeamCardView.swift
//  Football Chants
//
//  Created by Bambang Tri Rahmat Doni on 12/12/23.
//

import SwiftUI

struct TeamCardView: View {
    let team: Team
    
    var body: some View {
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
                    Text("Current \(self.team.manager.job.rawValue): ") +
                    Text("\(self.team.manager.name)")
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
        .teamCard(self.team.id)
    }
}

#Preview {
    TeamCardView(team: .empty)
}

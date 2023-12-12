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
                .accessibilityLabel(Text("\(self.team.name) Badge"))
            
            VStack(alignment: .leading) {
                Text(self.team.name)
                    .font(.system(.title2, design: .rounded).bold())
                    .padding(.bottom, 5.0)
                    .accessibilityLabel(Text("Team Name"))
                    .accessibilityValue(Text(self.team.name))
                
                HStack(alignment: .center,spacing: 5.0) {
                    Text("Founded: ")
                        .font(.subheadline.weight(.light).italic().bold())
                    Text(self.team.founded)
                        .font(.subheadline.weight(.light).italic())
                }
                .accessibilityLabel(Text("Year Founded"))
                .accessibilityValue(Text(self.team.founded))
                
                HStack(alignment: .center,spacing: 5.0) {
                    Text("Current \(self.team.manager.job.rawValue): ")
                        .font(.subheadline.weight(.light).italic().bold())
                    Text("\(self.team.manager.name)")
                        .font(.subheadline.weight(.light).italic())
                }
                .padding(.bottom, 5.0)
                .accessibilityLabel(Text("Current \(self.team.manager.job.rawValue)"))
                .accessibilityValue(Text(self.team.manager.name))
                
                Text(self.team.info)
                    .font(.footnote)
                    .accessibilityLabel(Text("Team Info"))
                    .accessibilityValue(Text(self.team.info))
            }
            
            Button {
                //
            } label: {
                Image(systemName: "play.circle.fill")
            }
            .font(.largeTitle)
            .foregroundColor(Color.white)
            .frame(maxHeight: .infinity, alignment: .center)
            .accessibilityElement(children: .ignore)
            .accessibilityValue(Text(self.team.isPlayingChant ?
                                     "Pause Chants" : 
                                        "Play Chants")
            )
        }
        .teamCard(self.team.id)
    }
}

#Preview {
    TeamCardView(team: .empty)
        .previewLayout(.sizeThatFits)
}

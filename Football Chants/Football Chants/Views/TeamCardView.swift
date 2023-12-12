//
//  TeamCardView.swift
//  Football Chants
//
//  Created by Bambang Tri Rahmat Doni on 12/12/23.
//

import SwiftUI

protocol TeamDelegate {
    func completionHandler(_ team: Team) -> Void
}

extension TeamDelegate {
    func completionHandler(_ team: Team) {
        print("Selected Team: \(team.name)")
    }
}

struct TeamCardView: View {
    let team: Team
    var delegate: TeamDelegate?
    
    var body: some View {
        HStack(alignment: .top) {
            
            VStack(alignment: .leading) {
                self.teamBadgeView()
                self.teamNameView()
                self.teamLeaderView()
                self.teamFoundedView()
                self.teamInfoView()
            }
            
            self.playButton {
                self.delegate?.completionHandler(self.team)
            }
        }
        .animation(.easeInOut, value: self.team)
        .teamCard(self.team.id)
    }
}

#Preview {
    TeamCardView(team: .empty)
        .previewLayout(.sizeThatFits)
}

private extension TeamCardView {
    @ViewBuilder
    private func teamBadgeView() -> some View {
        Image(self.team.id.badge)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50.0, height: 50.0)
            .accessibilityLabel(Text("\(self.team.name) Badge"))
    }
    
    @ViewBuilder
    private func teamNameView() -> some View {
        Text(self.team.name)
            .font(.system(.title2, design: .rounded).bold())
            .padding(.bottom, 5.0)
            .accessibilityLabel(Text("Team Name"))
            .accessibilityValue(Text(self.team.name))
    }
    
    @ViewBuilder
    private func teamFoundedView() -> some View {
        HStack(alignment: .center,spacing: 5.0) {
            Text("Founded: ")
                .font(.subheadline.weight(.light).italic().bold())
            Text(self.team.founded)
                .font(.subheadline.weight(.light).italic())
        }
        .accessibilityLabel(Text("Year Founded"))
        .accessibilityValue(Text(self.team.founded))
    }
    
    @ViewBuilder
    private func teamLeaderView() -> some View {
        HStack(alignment: .center,spacing: 5.0) {
            Text("Current \(self.team.manager.job.rawValue): ")
                .font(.subheadline.weight(.light).italic().bold())
            Text("\(self.team.manager.name)")
                .font(.subheadline.weight(.light).italic())
        }
        .padding(.bottom, 5.0)
        .accessibilityLabel(Text("Current \(self.team.manager.job.rawValue)"))
        .accessibilityValue(Text(self.team.manager.name))
    }
    
    @ViewBuilder
    private func teamInfoView() -> some View {
        Text(self.team.info)
            .font(.footnote)
            .accessibilityLabel(Text("Team Info"))
            .accessibilityValue(Text(self.team.info))
    }
    
    @ViewBuilder
    private func playButton(action: (@escaping () -> Void) = {}) -> some View {
        Button(action: action) {
            Image(systemName: self.team.isPlayingChant ?
                  "pause.circle.fill" :
                    "play.circle.fill"
            )
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
}

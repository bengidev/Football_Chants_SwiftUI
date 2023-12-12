//
//  AudioManager.swift
//  Football Chants
//
//  Created by Bambang Tri Rahmat Doni on 12/12/23.
//

import AVFAudio
import Foundation

final class AudioManager {
    private var manager: AVAudioPlayer? = .init()
    
    func playChant(for team: Team) -> Void {
        let bundle = Bundle.main
        let chantURL = bundle.url(forResource: team.id.chantFile, withExtension: "mp3")
        guard let chantURL = chantURL else { return }
        
        do {
            self.manager = try AVAudioPlayer(contentsOf: chantURL, fileTypeHint: "mp3")
            self.manager?.prepareToPlay()
            self.manager?.play()
            
            print("Audio Manager: \(String(describing: self.manager?.isPlaying))")
        } catch {
            print("Audio Manager Error: \(error.localizedDescription)")
        }
    }
    
    func resetChant() -> Void {
        self.manager?.stop()
        print("Audio Manager: \(String(describing: self.manager?.isPlaying))")
    }
}

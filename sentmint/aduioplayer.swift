//
//  aduioplayer.swift
//  sentmint
//
//  Created by yara mohammed alqahtani on 21/06/1444 AH.
//

import Foundation
import AVFoundation


class playaudio :ObservableObject{
    
    var player : AVAudioPlayer!
    func playSound(key :String) {
        
        let url = Bundle.main.url(forResource: key, withExtension: "mp3")
        guard url != nil else {
            return
        }
        
        do {
            player = try AVAudioPlayer (contentsOf: url!)
            player?.play ()
        } catch {
            print("error")
        }
        
        
    }
}

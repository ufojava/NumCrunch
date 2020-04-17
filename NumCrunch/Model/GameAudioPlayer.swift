//
//  GameAudioPlayer.swift
//  NumCrunch
//
//  Created by Ufuoma Okoro on 16/04/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Model to construct game music
import Foundation
import AVFoundation



var gameAudioPlayer: AVAudioPlayer?
var gameAudioPlayerBackground: AVAudioPlayer?


//Function to play Introduction mp3 files
func playAudioFile(soundFile:String,type:String) {
    
    
    if let soundFilePath = Bundle.main.path(forResource: soundFile, ofType: type) {
        
        do {
            
            
            gameAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFilePath))
            gameAudioPlayer?.play()
            
        } catch {
            
            print("Sound file not found")
        }
        
        
        
    }
    
    
    
}

//Function to play background Music
func playAudioBackgroundMusic(soundFile:String,type:String) {
    
    if let soundFilePath = Bundle.main.path(forResource: soundFile, ofType: type) {
        
        do {
            
            gameAudioPlayerBackground = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFilePath))
            gameAudioPlayerBackground?.numberOfLoops = -1
            gameAudioPlayerBackground?.volume = 0.4
            gameAudioPlayerBackground?.play()
            
            
        } catch {
            
            print("Sound file not found")
        }
    }
    
}


//Function to stop audio file play
func stopAudioPlay() {
    
    gameAudioPlayerBackground?.stop()
    
}





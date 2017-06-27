//
//  ViewController.swift
//  PlayAudioFile
//
//  Created by Jose Fabio_ on 27/06/17.
//  Copyright © 2017 com.yoyomero.josefabio. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var volumeImage: UIImageView!
    
    @IBOutlet var playPauseButton: UIButton!
    
    @IBOutlet var volumeController: UISlider!
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        
        volumeController.minimumValue = 0
        volumeController.maximumValue = 1
        
        volumeController.value = 1
        
        //Get the path of the audio
        let myFilePathString = Bundle.main.path(forResource: "Ballad of the Pegasus", ofType: "mp3")
        
        //Set the path
        if let myFilePathString = myFilePathString{
            let myFilePathURL = NSURL(fileURLWithPath: myFilePathString)
            
            do{
                
                try audioPlayer = AVAudioPlayer(contentsOf: myFilePathURL as URL)
                
            }catch { print("error alv") }
        }
    }
    
    @IBAction func playAudio() {
        if audioPlayer.isPlaying {
            //Set the button image to play, for normal and highlighted
            playPauseButton.setImage(UIImage.init(named: "Play"), for: .normal)
            playPauseButton.setImage(UIImage.init(named: "Selected Play"), for: .highlighted)
            
            //And stop the music
            audioPlayer.stop()
        }
        else {
            //Set the button image to pause, for normal and highlighted
            playPauseButton.setImage(UIImage.init(named: "Pause"), for: .normal)
            playPauseButton.setImage(UIImage.init(named: "Selected Pause"), for: .highlighted)
            
            //And play the music
            audioPlayer.play()
        }
    }
    
    @IBAction func stopButton() {
        audioPlayer.currentTime = 0
    }
    
    @IBAction func changeVolumen() {
        let currentVolume = volumeController.value
        
        audioPlayer.volume = currentVolume
        
        if currentVolume == 0 {
            volumeImage.image = #imageLiteral(resourceName: "Volume 0")
        }
        else if currentVolume > 0 && currentVolume < 0.33 {
            volumeImage.image = #imageLiteral(resourceName: "Volume 1")
        }
        else if currentVolume >= 0.33 && currentVolume < 0.66 {
            volumeImage.image = #imageLiteral(resourceName: "Volume 2")
        }
        else if currentVolume >= 0.66 {
            volumeImage.image = #imageLiteral(resourceName: "Volume 3")
        }
    }
    
    
    
    
}


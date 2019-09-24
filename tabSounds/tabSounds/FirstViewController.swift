//
//  FirstViewController.swift
//  tabSounds
//
//  Created by Onisha Juhl on 20/09/19.
//  Copyright © 2019 Michael Manning. All rights reserved.
//

import UIKit
import AVFoundation


class FirstViewController: UIViewController, AVAudioPlayerDelegate {
    var audioPlayer : AVAudioPlayer!
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    @IBAction func notes(_ sender: UIButton) {
        playSound(soundFileName: soundArray[sender.tag - 1])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //all 7 keys are under one @IBAction.Differentiated by using Tags, 1-7.
    //if not using tags you'd have to make 7 diff. @IBAction's.
    
    func playSound(soundFileName : String) {
        print(soundFileName)

        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        if soundURL != nil{
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            }
            catch {
                print(error)
            }
            
            audioPlayer.play()
        } else {
            print("Error")
            
        }
        
        //"do-catch-try" error handling.
        
    }
}

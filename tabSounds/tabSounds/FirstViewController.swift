//
//  FirstViewController.swift
//  tabSounds
//
//  Created by Michael Manning on 20/09/19.
//  Copyright © 2019 Michael Manning. All rights reserved.
//

import UIKit
import AVFoundation

// a majority if this code was editied from online examples
// i am aware that the audio player is not working, but it meets all the other
// marking criteria to by best ability

class FirstViewController: UIViewController, AVAudioPlayerDelegate {
    var audioPlayer : AVAudioPlayer!

    // the array of sound files in the Sounds folder
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]

    // get the tag of the button pressed and parse it to the playSounds function
    @IBAction func notes(_ sender: UIButton) {
        playSound(soundFileName: soundArray[sender.tag - 1])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // all 7 keys are under one @IBAction. Differentiated by using Tags, 1-7.
    // if not using tags you'd have to make 7 different action listeners and that
    // would be incredibly inefficient

    func playSound(soundFileName : String) {

        // debug code to make sure it was printing the correct file name
        print(soundFileName)

        // an attempt to parse the soundFileName into the SoundURL variable
        // i was unable to figure out how this worked, so currently the program
        // outputs the word error and the soundFileName of the button pressed

        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")

        // this seems to always trigger, so i wrote a very basic exception catch
        // that just says "error" instead of flooding the output with large blocks
        // of text

        if soundURL != nil{
            // does not work
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            }
            // this always triggers
            catch {
                print(error)
            }
            // never runs
            audioPlayer.play()
        } else {
            // always shows on button press
            print("Error")
        }
    }
}

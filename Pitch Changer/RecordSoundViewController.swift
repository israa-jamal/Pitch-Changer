//
//  RecordSoundViewController.swift
//  Pitch Changer
//
//  Created by Esraa Gamal on 5/19/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate{

    //Outlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingbutton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingbutton.isEnabled = false
        stopRecordingbutton.isHidden = true
    }
  
    @IBAction func recordPressed(_ sender: UIButton) {
        recordButton.isEnabled = false
        stopRecordingbutton.isEnabled = true
        stopRecordingbutton.isHidden = false
        label.text = "Recording in Progress"
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
        recordButton.isEnabled = true
        stopRecordingbutton.isEnabled = false
        //stopRecordingbutton.isHidden = true
        label.text = "Tap to Record"
        audioRecorder.stop()
            let audioSession = AVAudioSession.sharedInstance()
            try! audioSession.setActive(false)
        }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool){
        if flag{
        performSegue(withIdentifier: "toEffects", sender: audioRecorder.url)
        }else{
            print("recording failed")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "toEffects" {
            let soundEffectsVC = segue.destination as! SoundEffectsViewController
            let recordedAudioURL = sender as! URL
            soundEffectsVC.recordedAudioURL = recordedAudioURL

        }
}
    }
    


     

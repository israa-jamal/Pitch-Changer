//
//  ViewController.swift
//  Pitch Changer
//
//  Created by Esraa Gamal on 5/19/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingbutton: UIButton!
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
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
        recordButton.isEnabled = true
        stopRecordingbutton.isEnabled = false
        //stopRecordingbutton.isHidden = true
        label.text = "Tap to Record"

        
    }
    
}


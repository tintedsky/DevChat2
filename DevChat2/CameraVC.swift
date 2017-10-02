//
//  ViewController.swift
//  DevChat2
//
//  Created by Hongbo Niu on 2017-09-28.
//  Copyright © 2017 Udemy. All rights reserved.
//

import UIKit
import FirebaseAuth

class CameraVC: AVCamCameraViewController, AVCameraVCDelegate {

    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var previewView: AVCamPreviewView!
    
    override func viewDidLoad() {
        delegate = self
        
        self._previewView = previewView
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        performSegue(withIdentifier: "LogInVC", sender: nil)
        
        //        guard Auth.auth().currentUser != nil else {
        //            //load login vc
        //            performSegue(withIdentifier: "LogInVC", sender: nil)
        //            return
        //        }
    }
    
    @IBAction func recordBtnPressed(_ sender: Any) {
        toggleMovieRecording()
    }

    @IBAction func changeCameraBtnPressed(_ sender: Any) {
        changeCamera()
    }
    
    func shouldEnableCameraUI(_ enable: Bool) {
        cameraBtn.isEnabled = enable
        print("Should enable camera UI: \(enable)")
    }
    
    func shouldEnableRecordUI(_ enable: Bool) {
        recordBtn.isEnabled = enable
        print("Should enable recording UI:\(enable)")
    }
    
    func recordingHasStarted() {
        print("Recording has started")
    }
    
    func canStartRecording() {
        print("Can start recording")
    }
}


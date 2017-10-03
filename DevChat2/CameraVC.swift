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
        guard Auth.auth().currentUser != nil else {
            //load login vc
            performSegue(withIdentifier: "LogInVC", sender: nil)
            return
        }
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
    
    func videoRecordingCompleted(_ videoURL: URL!) {
        performSegue(withIdentifier: "UsersVC", sender:["videoURL":videoURL])
    }
    
    func videoRecordingFailed() {
        
    }
    
    func snapshotTaken(_ snapshotData: Data!) {
        performSegue(withIdentifier: "UsersVC", sender: ["snapshotData":snapshotData])
    }
    
    func snapshotFailed() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UsersVC" {
            if let usersVC = segue.destination as? UsersVC {
                if let videoDict = sender as? Dictionary<String, URL>{
                    let url = videoDict["videoURL"]
                    usersVC.videoURL = url
                }else if let snapDict = sender as? Dictionary<String, Data> {
                    let snapData = snapDict["snapshotData"]
                    usersVC.snapData = snapData
                }
            }
        }
    }
}


//
//  ViewController.swift
//  DevChat2
//
//  Created by Hongbo Niu on 2017-09-28.
//  Copyright © 2017 Udemy. All rights reserved.
//

import UIKit

class CameraVC: AVCamCameraViewController {

    @IBOutlet weak var previewView: AVCamPreviewView!
    
    override func viewDidLoad() {
        self._previewView = previewView
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}


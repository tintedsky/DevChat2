//
//  DataService.swift
//  DevChat2
//
//  Created by Hongbo Niu on 2017-10-02.
//  Copyright © 2017 Udemy. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataService {
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: DatabaseReference {
        return Database.database().reference()
    }
    
    func saveUser(uid:String){
        let profile:Dictionary<String, Any> = ["firstname":"", "lastname":""]
        mainRef.child("users").child(uid).child("profile").setValue(profile)
    }
}

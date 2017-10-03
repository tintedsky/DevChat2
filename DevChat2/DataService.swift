//
//  DataService.swift
//  DevChat2
//
//  Created by Hongbo Niu on 2017-10-02.
//  Copyright © 2017 Udemy. All rights reserved.
//

let CHILD_USERS = "users"

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DataService {
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var usersRef: DatabaseReference {
        return mainRef.child(CHILD_USERS)
    }
    
    var mainStorageRef: StorageReference{
        return Storage.storage().reference(forURL:"gs://devchat2-d4546.appspot.com")
    }
    
    var imagesStorageRef: StorageReference{
        return mainStorageRef.child("images")
    }
    
    var videoStorageRef: StorageReference{
        return mainStorageRef.child("videos")
    }
    
    func saveUser(uid:String){
        let profile:Dictionary<String, Any> = ["firstname":"", "lastname":""]
        mainRef.child(CHILD_USERS).child(uid).child("profile").setValue(profile)
    }
}

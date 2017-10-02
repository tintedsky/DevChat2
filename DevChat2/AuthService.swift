//
//  AuthService.swift
//  DevChat2
//
//  Created by Hongbo Niu on 2017-10-01.
//  Copyright © 2017 Udemy. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = ( _ errMsg : String?, _ data : Any?) -> Void

class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService{
        return _instance;
    }
    
    func login(email:String, password:String, onComplete: Completion?){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil{
                if let errorCode = AuthErrorCode(rawValue: (error?._code)!){
                    if errorCode == .userNotFound {
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil{
                                self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                            }else{
                                if user?.uid != nil{
                                    //Sign in
                                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil{
                                            self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                                        }else {
                                            onComplete?(nil, user)
                                        }
                                    })
                                }
                            }
                        })
                    }
                }
                else{
                    //Handle all other errors
                    self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                }
            }else{
                onComplete?(nil, user)
            }
        }
    }
    
    func handleFirebaseError(error:NSError, onComplete: Completion?){
        print(error.debugDescription)
        if let errorCode = AuthErrorCode(rawValue: (error._code)) {
            switch(errorCode){
            case .invalidEmail:
                onComplete?("Invalid email address", nil)
                break
            case .wrongPassword:
                onComplete?("Invalid password", nil)
                break
            case .emailAlreadyInUse, .accountExistsWithDifferentCredential:
                onComplete?("Could not create account. Email already in use", nil)
                break
            default:
                onComplete?("There was a problem authenticating. Try again.", nil)
            }
        }
    }
}

//
//  AuthService.swift
//  DevChat2
//
//  Created by Hongbo Niu on 2017-10-01.
//  Copyright © 2017 Udemy. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService{
        return _instance;
    }
    
    func login(email:String, password:String){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil{
                if let errorCode = AuthErrorCode(rawValue: (error?._code)!){
                    if errorCode == .userNotFound {
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil{
                                //show error to user
                            }else{
                                if user?.uid != nil{
                                    //Sign in
                                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil{
                                            //Show error to user
                                        }else {
                                            //we have successfully logged in
                                        }
                                    })
                                }
                            }
                        })
                    }
                }
                else{
                    //Handle all other errors
                }
            }else{
                //Successfully logged in
            }
        }
    }
}

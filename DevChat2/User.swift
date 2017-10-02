//
//  User.swift
//  DevChat2
//
//  Created by Hongbo Niu on 2017-10-02.
//  Copyright © 2017 Udemy. All rights reserved.
//

import UIKit

struct User {
    private var _firstName: String
    private var _uid: String
    
    var uid: String{
        return _uid
    }
    
    var firstName: String{
        return _firstName
    }
    
    init(uid: String, firstName: String){
        _uid = uid
        _firstName = firstName
    }
}

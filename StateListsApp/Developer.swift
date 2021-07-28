//
//  Developer.swift
//  StateListsApp
//
//  Created by Alex Tran on 11/23/20.
//

import UIKit

class Developer: NSObject {
    var name = ""
    var age = ""
    var gender = ""
    var from = ""
    var hobby = ""
    
    init(Name: String, Age: String, Gender: String, From: String, Hobby: String) {
        name = Name
        age = Age
        gender = Gender
        from = From
        hobby = Hobby
    }
}

//
//  StateListItem.swift
//  StateListsApp
//
//  Created by Alex Tran on 11/18/20.
//

import UIKit

class StateListItem: NSObject {
    var name = ""
    var abbreviation = ""
    var flag = ""
    var seal = ""
    var population = ""
    var capital = ""
    var largest = ""
    var area = ""
    
    
    init(_ Name: String,_ Abbreviation: String,_ Flag: String,_ Seal: String,_ Population: String,_ Capital: String,_ Largest: String,_ Area: String) {
        name = Name
        abbreviation = Abbreviation
        flag = Flag
        seal = Seal
        population = Population
        capital = Capital
        largest = Largest
        area = Area
    }
}

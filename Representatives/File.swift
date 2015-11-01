//
//  File.swift
//  Representatives
//
//  Created by Andrew Porter on 11/1/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Representative {
    
    static let nameKey = "name"
    static let partyKey = "party"
    static let stateKey = "state"
    static let districtKey = "district"
    static let phoneKey = "phone"
    static let officeKey = "office"
    static let linkKey = "link"
    static let resultsKey = "results"
    
    let name: String?
    let party: String?
    let state: String?
    let district: String?
    let phone: String?
    let office: String?
    let link: String?
    
    init(jsonDictionary: [String: String]) {
     
        self.name = jsonDictionary[Representative.nameKey]
        self.party = jsonDictionary[Representative.partyKey]
        self.state = jsonDictionary[Representative.stateKey]
        self.district = jsonDictionary[Representative.districtKey]
        self.phone = jsonDictionary[Representative.phoneKey]
        self.office = jsonDictionary[Representative.officeKey]
        self.link = jsonDictionary[Representative.linkKey]
        
    }
    
    
    
}
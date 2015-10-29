//
//  Representative.swift
//  Representatives
//
//  Created by Andrew Porter on 10/29/15.
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
    
    var name: String? = ""
    var party: String? = ""
    var state: String? = ""
    var district: String? = ""
    var phone: String? = ""
    var office: String? = ""
    var link: String? = ""
    
    init(jsonDictionary: [String: AnyObject]) {
        self.name = jsonDictionary[Representative.nameKey] as? String
        self.state = jsonDictionary[Representative.stateKey] as? String
        self.party = jsonDictionary[Representative.partyKey] as? String
        self.district = jsonDictionary[Representative.districtKey] as? String
        self.phone = jsonDictionary[Representative.phoneKey] as? String
        self.office = jsonDictionary[Representative.officeKey] as? String
        self.link = jsonDictionary[Representative.linkKey] as? String
    }
    
    
}
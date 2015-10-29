//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Andrew Porter on 10/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    
    static func searchRepsByState(state: String, completion: (representatives: [Representative]) -> Void) {
        
        let url = NetworkController.searchURLByState(state)
        print(url)
        NetworkController.dataAtUrl(url) { (resultData) -> Void in
            guard let representativeData = resultData else {
                print("no data returned")
                completion(representatives: [])
                return
            }
            do {
                let resultsDictionary = try NSJSONSerialization.JSONObjectWithData(representativeData, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
                
                let representativeDictionaries = resultsDictionary["results"] as! [[String: String]]
                
                var arrayOfRepresentatvieModelObjects: [Representative] = []
                
                for dictionary in representativeDictionaries {
                    let rep = Representative(jsonDictionary: dictionary)
                    arrayOfRepresentatvieModelObjects.append(rep)
                }
                completion(representatives: arrayOfRepresentatvieModelObjects)
                
            } catch {
                print("Error serializing JSON")
                completion(representatives: [])
                return
            }
        }
    }
}
//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Andrew Porter on 11/1/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static func searchRepsByState(state: String, completion: (representative: [Representative]) -> Void) {
        
        let url = NetworkController.searchURL(state)
        
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            //Check to see if the dataAtURL returns nil
            guard let repData = resultData else {
                print("NO DATA WAS RETURNED")
                completion(representative: [])
                return
            }
            
            do {
                //If Data was returned convert JSON into dictionary
                let resultsDictionary = try NSJSONSerialization.JSONObjectWithData(repData, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
                
                //Create an array of Dictionaries from the dictionary that came back from the serialization of the JSON
                let representativeDictionaries = resultsDictionary[Representative.resultsKey] as! [[String: String]]
                
                // create an empty array to hold the model objects that will be created from the serialized JSON array of dictionaries
                var arrayOfRepresentativeModelObjects: [Representative] = []
                
                // iterate through the array of dictionaires to create individual model objects then add them to the array
                for dictionary in representativeDictionaries {
                    
                    let rep = Representative(jsonDictionary: dictionary)
                    arrayOfRepresentativeModelObjects.append(rep)
                }
                
                // run completion block with the array of the model objects
                completion(representative: arrayOfRepresentativeModelObjects)
                
                
            } catch {
                // Catch if error happened during serialization
                print("Error serializing JSON")
                completion(representative: [])
                return
            }
        }
    }
}
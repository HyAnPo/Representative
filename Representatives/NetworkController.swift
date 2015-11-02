//
//  NetworkController.swift
//  Representatives
//
//  Created by Andrew Porter on 11/1/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {
    
    static let baseURLString = "http://whoismyrepresentative.com/getall_reps_bystate.php?state="
    static let jsonAddOn = "&output=json"
    
    //Build url
    static func searchURL(state: String) -> NSURL {
        
        return NSURL(string: NetworkController.baseURLString + state + NetworkController.jsonAddOn)!
    }
    
    //
    static func dataAtURL(url: NSURL, completion: (resultData: NSData?) -> ()) {
        //Create network call
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            //Check to see if call was succesfull
            guard let data = data else {
                print("error?.localizedDescriptio")
                completion(resultData: nil)
                return
            }
            
            completion(resultData: data)
        }
        //After check resume Task
        dataTask.resume()
    }
    
}
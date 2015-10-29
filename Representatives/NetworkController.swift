//
//  NetworkController.swift
//  Representatives
//
//  Created by Andrew Porter on 10/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class NetworkController: NSObject {
    
    static let baseURLString = "https://whoismyrepresentative.com"
    
    static func searchURLByState(state : String) -> NSURL {
    
        return NSURL(string: NetworkController.baseURLString + "/getall_reps_bystate.php?state=\(state)&output=json")!
    }
    
    static func dataAtUrl(url: NSURL, completion:(resultData: NSData?) -> Void) {
            let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) -> Void in
            print(url)
                
                guard let data = data else {
                    print(error?.localizedDescription)
                    completion(resultData: nil)
                    return
                }
                
                completion(resultData: data)
            }
            
            dataTask.resume()
    }
}
//
//  SearchViewController.swift
//  Representatives
//
//  Created by Taylor Mott on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    //MARK: - Properties
    let states = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    var resultReps: [Representative] = []
    
    @IBAction func searchButtonTapped(sender: UIButton) {
        let index = self.pickerView.selectedRowInComponent(0)
        let stateString = self.states[index]
        print(stateString)
        RepresentativeController.searchRepsByState(stateString) { (representatives) in
            if representatives.count > 0 {
                self.resultReps = representatives
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    self.performSegueWithIdentifier("searchComplete", sender: self)
                })
                
            } else {
                print("Error searching for reps")
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        if segue.identifier == "searchComplete" {
            
            let resultsTableViewController = segue.destinationViewController as! ResultsTableViewController
            
            resultsTableViewController.resultsRep = resultReps
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}

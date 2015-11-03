//
//  SearchViewController.swift
//  Representatives
//
//  Created by Taylor Mott on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDataSource {
    
    var stateReps: [Representative] = []
    
    //MARK: - Properties
    let states = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func searchButtonTapped(sender: UIButton) {
        // Create an index from the pickerview
        let index = self.pickerView.selectedRowInComponent(0)
        
        // Get the value from the array of states with the index of the selected row
        let stateString = self.states[index]
        
        // Call the search for reps function in the RepresentativeController and give it the state value from the picker view
        RepresentativeController.searchRepsByState(stateString) { (representative) -> Void in
            
            // check to see if there is anything in the representatives array given from the completion block
            if representative.count > 0 {
                
                // give the Representative objects to the new array
                self.stateReps = representative
                
                // Since the network call is is an asyncronus task nothing will load on the view unless we put the view back on the main queue
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.performSegueWithIdentifier("showResultsSegue", sender: self)
                })
                
            } else {
                
                print("There was an error searching for reps.")
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showResultsSegue" {
            let resultsTableViewController = segue.destinationViewController as! ResultsTableViewController
            
            resultsTableViewController.repsArray = self.stateReps
        }
    }
    
    
    //MARK: - UIPickerViewDataSource/Delegate methods
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.states.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        
        return "🇺🇸\(self.states[row])🇺🇸"
    }
}

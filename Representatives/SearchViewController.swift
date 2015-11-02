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
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func searchButtonTapped(sender: UIButton) {
        // Create an index from the pickerview
        let index = self.pickerView.selectedRowInComponent(0)
        
        // Get the value from the array of states with the index of the selected row
        let stateString = self.states[index]
        
    }
    
    
    //MARK: - Properties
    let states = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    
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

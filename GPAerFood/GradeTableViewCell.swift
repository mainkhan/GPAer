//
//  GradeTableViewCell.swift
//  GPAerFood
//
//  Created by Main Khan on 12/4/16.
//  Copyright © 2016 Main Khan. All rights reserved.
//

import UIKit

class GradeTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var gradeValueField: UITextField!
    @IBOutlet weak var weightControl: UISegmentedControl!
    @IBOutlet weak var fullHalfControl: UISegmentedControl!
    
//    weak var delegate:TableViewCellProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Second Lightest Orange 100, 91.8, 82.7
        self.backgroundColor=UIColor(red: 1, green: 0.918, blue: 0.827, alpha: 1)
        
        
        // Set segmented control colors to Darker Orange 100, 53.7, 0
        weightControl.tintColor = UIColor(red: 1, green: 0.537, blue: 0, alpha: 1)
        fullHalfControl.tintColor = UIColor(red: 1, green: 0.537, blue: 0, alpha: 1)
        
        addDoneButtonOnKeyboard()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func becomeFirstResponder() -> Bool {
        return self.gradeValueField.becomeFirstResponder()
    }
    
    // Function to add a done button to the grade input keyboard
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(ViewController.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.gradeValueField.inputAccessoryView = doneToolbar
    }
    
    // Function that will excecute when the custom done button is pressed
    func doneButtonAction() {
        self.gradeValueField.resignFirstResponder()
    }

}

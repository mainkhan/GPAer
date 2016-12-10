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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addDoneButtonOnKeyboard()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Function to dismiss keyboards when anything outside the keyboard is touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            gradeValueField.resignFirstResponder()
        }
        super.touchesBegan(touches, with: event)
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

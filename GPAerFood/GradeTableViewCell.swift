//
//  GradeTableViewCell.swift
//  GPAerFood
//
//  Created by Main Khan on 12/4/16.
//  Copyright © 2016 Main Khan. All rights reserved.
//

import UIKit

protocol TableViewCellProtocol: class {
    func didFinishTask(sender: UITableViewCell)
}

extension GradeTableViewController: TableViewCellProtocol {
    func didFinishTask(sender: UITableViewCell) {
        // do stuff like updating the UI
    }
}

class GradeTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var gradeValueField: UITextField!
    @IBOutlet weak var weightControl: UISegmentedControl!
    @IBOutlet weak var fullHalfControl: UISegmentedControl!
    
    weak var delegate:TableViewCellProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Set BG color to Pastel Orange 100, 88.6, 75.3
        self.backgroundColor=UIColor(red: 1, green: 0.886, blue: 0.753, alpha: 1)
        // Set segmented control colors to Darker Orange 100, 53.7, 0
        weightControl.tintColor = UIColor(red: 1, green: 0.537, blue: 0, alpha: 1)
        fullHalfControl.tintColor = UIColor(red: 1, green: 0.537, blue: 0, alpha: 1)
        
        // Set Delegate
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

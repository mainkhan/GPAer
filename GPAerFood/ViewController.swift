//
//  ViewController.swift
//  GPAerFood
//
//  Created by Main Khan on 12/1/16.
//  Copyright © 2016 Main Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var schoolTextField: UITextField!
    @IBOutlet weak var lpgTextField: UITextField!
    @IBOutlet weak var ninthGradeLabel: UILabel!
    @IBOutlet weak var tenthGradeLabel: UILabel!
    @IBOutlet weak var eleventhGradeLabel: UILabel!
    @IBOutlet weak var twelfthGradeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        schoolTextField.delegate = self
        lpgTextField.delegate = self
        
        // Add done button on number keyboard
        self.addDoneButtonOnKeyboard()
        
        // Set tags to differentiate text fields
        schoolTextField.tag = 100
        lpgTextField.tag = 101
    }
    
    // Function to add a done button on the LPG Keyboard
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
        
        self.lpgTextField.inputAccessoryView = doneToolbar
    }
    
    func doneButtonAction() {
        self.lpgTextField.resignFirstResponder()
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField.tag == 100) {
            schoolTextField.resignFirstResponder()
        }
        else if ( textField.tag == 101) {
            lpgTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.tag == 100) {
            print(schoolTextField.text!)
        }
        else if ( textField.tag == 101) {
            print(lpgTextField.text!)
        }
    }
    
    // MARK: Actions
    @IBAction func  ninthGradeEdit(sender: UITapGestureRecognizer) {
        ninthGradeLabel.text = ninthGradeLabel.text! + "\t+"
    }
    
    // Function to dismiss keyboards when anything outside the keyboard is touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            lpgTextField.resignFirstResponder()
            schoolTextField.resignFirstResponder()
        }
        super.touchesBegan(touches, with: event)
    }
}


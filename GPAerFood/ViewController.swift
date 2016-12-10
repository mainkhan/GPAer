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
    
//    let gradientLayer = CAGradientLayer()
    
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
        
        // Gradient Setup
        // Shiny Blue 4.7, 69, 100
//        self.view.backgroundColor = UIColor(red: 0.047, green: 0.69, blue: 1, alpha: 1)
        
        // Pastel Blue 70.6, 85.1, 92.2
        self.view.backgroundColor = UIColor(red: 0.706, green: 0.851, blue: 0.922, alpha: 1)
        
        
//        // 2
//        gradientLayer.frame = self.view.bounds
//        
//        // 3
//        let color1 = UIColor.yellow.cgColor as CGColor
//        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0).cgColor as CGColor
//        let color3 = UIColor.clear.cgColor as CGColor
//        let color4 = UIColor(white: 0.0, alpha: 0.2).cgColor as CGColor
//        gradientLayer.colors = [color3, color4]
//        
//        // 4
//        gradientLayer.locations = [0.0, 0.5]
//        
//        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
//        
//        // 5
//        self.view.layer.addSublayer(gradientLayer)
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
    
    // Function to dismiss keyboards when anything outside the keyboard is touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            lpgTextField.resignFirstResponder()
            schoolTextField.resignFirstResponder()
        }
        super.touchesBegan(touches, with: event)
    }
    
    // MARK: Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "NinthSegue") {
            print("Ninth grade segue IDENTIFIED")
        }
        else if (segue.identifier == "TenthSegue") {
            print("Something else was IDENTIFIED")
        }
        else if (segue.identifier == "EleventhSegue") {
            print("Eleventh grade segue IDENTIFIED")
        }
        else if (segue.identifier == "TwelfthSegue") {
            print("Twelfth grade segue IDENTIFIED")
        }
    }
}


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
    
    // MARK: Data (4 years)
    var ninth = Year(whatGrade: 9)
    var tenth = Year(whatGrade: 10)
    var eleventh = Year(whatGrade: 11)
    var twelfth = Year(whatGrade: 12)
    
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
        
        // Change the GPA values of each grade IF there are grades inputted
        print("number of ninth grades", ninth.grades.count)
        if (ninth.grades.count > 0) {
            addGpatoLabel(year: ninth, textLabel: ninthGradeLabel)
            print("changed the label")
        }
        
        if (tenth.grades.count > 0) {
            addGpatoLabel(year: tenth, textLabel: tenthGradeLabel)
        }
        
        if (eleventh.grades.count > 0) {
            addGpatoLabel(year: eleventh, textLabel: eleventhGradeLabel)
        }
        
        if (twelfth.grades.count > 0) {
            addGpatoLabel(year: twelfth, textLabel: twelfthGradeLabel)
        }

    }

    func addGpatoLabel(year: Year, textLabel: UILabel) {
        let gpa = year.calculateGpa()
        textLabel.text = textLabel.text! + "\t \(gpa)"
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
//            print(schoolTextField.text!)
        }
        else if ( textField.tag == 101) {
//            print(lpgTextField.text!)
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
            let gradeTableVC = segue.destination as! GradeTableViewController
            
            // change the text of the title
            gradeTableVC.navigationBar.title = ninthGradeLabel.text

            // pass data on to the next view
            gradeTableVC.year = ninth
            
        }
        else if (segue.identifier == "TenthSegue") {
            let gradeTableVC = segue.destination as! GradeTableViewController
            
            // change the text of the title
            gradeTableVC.navigationBar.title = tenthGradeLabel.text
            
            // pass data on to the next view
            gradeTableVC.year = tenth

        }
        else if (segue.identifier == "EleventhSegue") {
            let gradeTableVC = segue.destination as! GradeTableViewController
            
            // change the text of the title
            gradeTableVC.navigationBar.title = eleventhGradeLabel.text
            
            // pass data on to the next view
            gradeTableVC.year = eleventh
        }
        else if (segue.identifier == "TwelfthSegue") {
            let gradeTableVC = segue.destination as! GradeTableViewController
            
            // change the text of the title
            gradeTableVC.navigationBar.title = twelfthGradeLabel.text
            
            // pass data on to the next view
            gradeTableVC.year = twelfth
        }
    }
    
//    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
//        print ("code is executed")
//        if let sourceViewController = sender.source as?
//            GradeTableViewController, let tempYear = sourceViewController.year {
//            print (tempYear.whatGrade as Any, "th grade was the sender")
//        }
//    }
}


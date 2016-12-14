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
    @IBOutlet weak var cumulativeGpa: UILabel!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    // MARK: Data (4 years)
    var ninth = Year(whatGrade: 9)
    var tenth = Year(whatGrade: 10)
    var eleventh = Year(whatGrade: 11)
    var twelfth = Year(whatGrade: 12)
    
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
    
        
        // Pastel Blue for top views 70.6, 85.1, 92.2
        self.view.backgroundColor = UIColor(red: 0.706, green: 0.851, blue: 0.922, alpha: 1)
        self.innerView.backgroundColor = UIColor(red: 0.706, green: 0.851, blue: 0.922, alpha: 1)
        
        // Pastel Orange for bottom view 100, 95.3, 90.2
        self.bottomView.backgroundColor = UIColor(red: 1, green: 0.953, blue: 0.902, alpha: 1)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Change the GPA values of each grade IF there are grades inputted
        updateGpaLabels()
    }
    
    func updateGpaLabels() {
        let lpg = getLowestPassingGrade()
        
        var cumulativeSum = Float(0.0)
        var numberOfYears = 0
        if (ninth.grades.count > 0) {
            let gpa = ninth.calculateGpa()
            let roundedGpa = Int(round(gpa!))
            let scaled = getScaledGpa(gpa: roundedGpa, lpg: lpg)
            
            ninthGradeLabel.text = "9th Grade:\t\(roundedGpa) = \(scaled)"
            cumulativeSum = cumulativeSum + scaled
            numberOfYears = numberOfYears + 1
        }
        
        if (tenth.grades.count > 0) {
            let gpa = tenth.calculateGpa()
            let roundedGpa = Int(round(gpa!))
            let scaled = getScaledGpa(gpa: roundedGpa, lpg: lpg)
            
            tenthGradeLabel.text = "10th Grade:\t\(roundedGpa) = \(scaled)"
            cumulativeSum = cumulativeSum + scaled
            numberOfYears = numberOfYears + 1
        }
        
        if (eleventh.grades.count > 0) {
            let gpa = eleventh.calculateGpa()
            let roundedGpa = Int(round(gpa!))
            let scaled = getScaledGpa(gpa: roundedGpa, lpg: lpg)
            
            eleventhGradeLabel.text = "11th Grade:\t\(roundedGpa) = \(scaled)"
            cumulativeSum = cumulativeSum + scaled
            numberOfYears = numberOfYears + 1
        }
        
        if (twelfth.grades.count > 0) {
            let gpa = twelfth.calculateGpa()
            let roundedGpa = Int(round(gpa!))
            let scaled = getScaledGpa(gpa: roundedGpa, lpg: lpg)
            
            twelfthGradeLabel.text = "12th Grade:\t\(roundedGpa) = \(scaled)"
            cumulativeSum = cumulativeSum + scaled
            numberOfYears = numberOfYears + 1
        }
        
        if (numberOfYears > 0) {
            var outputGpa = cumulativeSum / Float(numberOfYears)
            outputGpa = round(10 * outputGpa) / 10
            cumulativeGpa.text = String(outputGpa)
            
//            if outputGpa >= 3.3 {
//                // Green 0, 83.9, 22
//                cumulativeGpa.textColor = UIColor(red: 0, green: 0.839, blue: 0.22, alpha: 1)
//            }
//            else if outputGpa > 2.5 {
//                // Yellow 80.8, 97.6, 0
//                cumulativeGpa.textColor = UIColor(red: 0.808, green: 0.976, blue: 0, alpha: 1)
//            }
//            else {
//                cumulativeGpa.textColor = UIColor.red
//            }
            
        }
        else {
            cumulativeGpa.text = String(0.0)
//            cumulativeGpa.textColor = UIColor.red
        }
    }
    
    func getLowestPassingGrade () -> Int {
        if lpgTextField.text == "60" {
            return 60
            
        }
        else if lpgTextField.text == "70" {
            return 70
        }
        else  {
            // default LPG of 65
            return 65
        }
    }
    
    @IBAction func clearAll () {
        ninth = Year(whatGrade: 9)
        tenth = Year(whatGrade: 10)
        eleventh = Year(whatGrade: 11)
        twelfth = Year(whatGrade: 12)
        cumulativeGpa.text = String(0.0)
        lpgTextField.text = ""
        schoolTextField.text = ""
        ninthGradeLabel.text = "9th Grade"
        tenthGradeLabel.text = "10th Grade"
        eleventhGradeLabel.text = "11th Grade"
        twelfthGradeLabel.text = "12th Grade"
    }
    
    func getScaledGpa(gpa: Int, lpg: Int) -> Float {
        if lpg == 60 {
            if gpa >= 99 {
                return 4.3
            }
            else if (gpa == 98 || gpa == 97) {
                return 4.2
            }
            else if (gpa == 96 || gpa == 95) {
                return 4.1
            }
            else if (gpa == 94 || gpa == 93) {
                return 4.0
            }
            else if (gpa == 92) {
                return 3.9
            }
            else if (gpa == 91) {
                return 3.8
            }
            else if (gpa == 90) {
                return 3.7
            }
            else if (gpa == 89) {
                return 3.6
            }
            else if (gpa == 88) {
                return 3.5
            }
            else if (gpa == 87) {
                return 3.4
            }
            else if (gpa == 86) {
                return 3.3
            }
            else if (gpa == 85) {
                return 3.2
            }
            else if (gpa == 84) {
                return 3.1
            }
            else if (gpa == 83) {
                return 3.0
            }
            else if (gpa == 82) {
                return 2.9
            }
            else if (gpa == 81) {
                return 2.8
            }
            else if (gpa == 80) {
                return 2.7
            }
            else if (gpa == 79) {
                return 2.6
            }
            else if (gpa == 78) {
                return 2.5
            }
            else if (gpa == 77) {
                return 2.4
            }
            else if (gpa == 76) {
                return 2.3
            }
            else if (gpa == 75) {
                return 2.2
            }
            else if (gpa == 74) {
                return 2.1
            }
            else if (gpa == 73) {
                return 2.0
            }
            else if (gpa == 72) {
                return 1.9
            }
            else if (gpa == 71) {
                return 1.8
            }
            else if (gpa == 70) {
                return 1.7
            }
            else if (gpa == 69) {
                return 1.6
            }
            else if (gpa == 68) {
                return 1.5
            }
            else if (gpa == 67) {
                return 1.4
            }
            else if (gpa == 66) {
                return 1.3
            }
            else if (gpa == 65) {
                return 1.2
            }
            else if (gpa == 64) {
                return 1.1
            }
            else if (gpa == 63) {
                return 1.0
            }
            else if (gpa == 62) {
                return 0.9
            }
            else if (gpa == 61) {
                return 0.8
            }
            else if (gpa == 60) {
                return 0.7
            }
            else {
                return 0.0
            }
            
        }
        else if lpg == 65 {
            if gpa >= 99 {
                return 4.3
            }
            else if (gpa == 98 || gpa == 97) {
                return 4.2
            }
            else if (gpa == 96) {
                return 4.1
            }
            else if (gpa == 95 || gpa == 94) {
                return 4.0
            }
            else if (gpa == 93) {
                return 3.9
            }
            else if (gpa == 92) {
                return 3.8
            }
            else if (gpa == 91) {
                return 3.7
            }
            else if (gpa == 90) {
                return 3.6
            }
            else if (gpa == 89) {
                return 3.4
            }
            else if (gpa == 88) {
                return 3.3
            }
            else if (gpa == 87) {
                return 3.2
            }
            else if (gpa == 86) {
                return 3.1
            }
            else if (gpa == 85) {
                return 3.0
            }
            else if (gpa == 84) {
                return 2.9
            }
            else if (gpa == 83) {
                return 2.8
            }
            else if (gpa == 82) {
                return 2.7
            }
            else if (gpa == 81) {
                return 2.6
            }
            else if (gpa == 80) {
                return 2.4
            }
            else if (gpa == 79) {
                return 2.3
            }
            else if (gpa == 78) {
                return 2.2
            }
            else if (gpa == 77) {
                return 2.1
            }
            else if (gpa == 76) {
                return 2.0
            }
            else if (gpa == 75) {
                return 1.9
            }
            else if (gpa == 74) {
                return 1.8
            }
            else if (gpa == 73) {
                return 1.7
            }
            else if (gpa == 72) {
                return 1.6
            }
            else if (gpa == 71) {
                return 1.4
            }
            else if (gpa == 70) {
                return 1.3
            }
            else if (gpa == 69) {
                return 1.2
            }
            else if (gpa == 68) {
                return 1.1
            }
            else if (gpa == 67) {
                return 0.9
            }
            else if (gpa == 66) {
                return 0.8
            }
            else if (gpa == 65) {
                return 0.7
            }
            else {
                return 0.0
            }
        }
        else {
            if gpa >= 100 {
                return 4.3
            }
            else if (gpa == 99) {
                return 4.2
            }
            else if (gpa == 98) {
                return 4.1
            }
            else if (gpa == 97 || gpa == 96) {
                return 4.0
            }
            else if (gpa == 95) {
                return 3.9
            }
            else if (gpa == 94 || gpa == 93) {
                return 3.7
            }
            else if (gpa == 92) {
                return 3.5
            }
            else if (gpa == 91) {
                return 3.4
            }
            else if (gpa == 90) {
                return 3.3
            }
            else if (gpa == 89) {
                return 3.2
            }
            else if (gpa == 88) {
                return 3.0
            }
            else if (gpa == 87) {
                return 2.9
            }
            else if (gpa == 86) {
                return 2.8
            }
            else if (gpa == 85) {
                return 2.7
            }
            else if (gpa == 84) {
                return 2.5
            }
            else if (gpa == 83) {
                return 2.3
            }
            else if (gpa == 82) {
                return 2.2
            }
            else if (gpa == 81) {
                return 2.1
            }
            else if (gpa == 80) {
                return 2.0
            }
            else if (gpa == 79) {
                return 1.9
            }
            else if (gpa == 78) {
                return 1.7
            }
            else if (gpa == 77) {
                return 1.6
            }
            else if (gpa == 76) {
                return 1.4
            }
            else if (gpa == 75) {
                return 1.3
            }
            else if (gpa == 74) {
                return 1.2
            }
            else if (gpa == 73) {
                return 1.0
            }
            else if (gpa == 72) {
                return 0.9
            }
            else if (gpa == 71) {
                return 0.8
            }
            else if (gpa == 70) {
                return 0.7
            }
            else {
                return 0.0
            }
        }
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
            // if LPG is done editing, update GPA labels
            updateGpaLabels()
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
            gradeTableVC.navigationBar.title = "9th Grade"

            // pass data on to the next view
            gradeTableVC.year = ninth
            
        }
        else if (segue.identifier == "TenthSegue") {
            let gradeTableVC = segue.destination as! GradeTableViewController
            
            // change the text of the title
            gradeTableVC.navigationBar.title = "10th Grade"
            
            // pass data on to the next view
            gradeTableVC.year = tenth

        }
        else if (segue.identifier == "EleventhSegue") {
            let gradeTableVC = segue.destination as! GradeTableViewController
            
            // change the text of the title
            gradeTableVC.navigationBar.title = "11th Grade"
            
            // pass data on to the next view
            gradeTableVC.year = eleventh
        }
        else if (segue.identifier == "TwelfthSegue") {
            let gradeTableVC = segue.destination as! GradeTableViewController
            
            // change the text of the title
            gradeTableVC.navigationBar.title = "12th Grade"
            
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


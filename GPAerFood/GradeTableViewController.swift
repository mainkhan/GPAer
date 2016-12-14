//
//  GradeTableViewController.swift
//  GPAerFood
//
//  Created by Main Khan on 12/4/16.
//  Copyright © 2016 Main Khan. All rights reserved.
//

import UIKit

class GradeTableViewController: UITableViewController {
    
    // MARK: Properties
    var year: Year!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var addButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Table Background to 100, 95.3, 90.2 Lightest orange
        self.view.backgroundColor = UIColor(red: 1, green: 0.953, blue: 0.902, alpha: 1)
    }
    
    // Function to dismiss keyboards when anything outside the keyboard is touched
    @IBAction func dismissKeyboard() {
        self.tableView.endEditing(true)
    }
    
    @IBAction func addGrade(_ sender: UIBarButtonItem) {
        year.grades.append(Grade(grade: 0))
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: year.grades.count-1, section: 0)],
                             with: .automatic)
        tableView.endUpdates()
        tableView.cellForRow(at: IndexPath(row: year.grades.count-1, section: 0))?.becomeFirstResponder()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.year.grades.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "GradeTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! GradeTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let grade = year.grades[indexPath.row]

        cell.gradeValueField.text = "\(grade.grade)"
        cell.weightControl.selectedSegmentIndex = (grade.weight)
        cell.fullHalfControl.selectedSegmentIndex = (grade.isHalfCredit)

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            year.grades.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // back button is tapped, save all printed data to year property
        if self.navigationController?.topViewController != self {
            let visibleIndexPaths = tableView.indexPathsForVisibleRows
            
            // loop through all cells in view and change the value of the corresponding grade
            for (index, element) in (visibleIndexPaths?.enumerated())! {
                let cell = tableView.cellForRow(at: element) as! GradeTableViewCell
                
                if cell.gradeValueField.text != "" {
                    year.grades[index].grade = Float(cell.gradeValueField.text!)!
                }
                else {
                    year.grades[index].grade = 0
                }
                
                year.grades[index].isHalfCredit = cell.fullHalfControl.selectedSegmentIndex
                year.grades[index].weight = cell.weightControl.selectedSegmentIndex
            }
            
        }
    }

}

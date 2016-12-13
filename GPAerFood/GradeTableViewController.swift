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
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Lighter blue 80, 90.6, 95.7
//        self.view.backgroundColor = UIColor(red: 0.8, green: 0.906, blue: 0.957, alpha: 1)
        
        // Pastel Blue 70.6, 85.1, 92.2
        self.view.backgroundColor = UIColor(red: 0.706, green: 0.851, blue: 0.922, alpha: 1)
        
        // Light Orange 100, 88.6, 75.3
//        self.view.backgroundColor = UIColor(red: 1, green: 0.886, blue: 0.753, alpha: 1)
        
        // Shiny Orange (trash) 100, 53.7, 0
//        self.view.backgroundColor = UIColor(red: 1, green: 0.537, blue: 0, alpha: 1)

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

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
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
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

/*    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print(sender as Any)
        
    }*/
    
    // Do preperation before moving back to main GPAer view
//    override func willMove(toParentViewController parent: UIViewController?) {
//        parent as! ViewController
//        
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // back button is tapped, save all printed data to year property
        if self.navigationController?.topViewController != self {
            let visibleIndexPaths = tableView.indexPathsForVisibleRows
            
            // loop through all cells in view and change the value of the corresponding grade
            for (index, element) in (visibleIndexPaths?.enumerated())! {
                let cell = tableView.cellForRow(at: element) as! GradeTableViewCell
                
                year.grades[index].grade = Float(cell.gradeValueField.text!)!
                year.grades[index].isHalfCredit = cell.fullHalfControl.selectedSegmentIndex
                year.grades[index].weight = cell.weightControl.selectedSegmentIndex
            }
            
            // debug: print the grades and their properties
//            print("printing grades")
//            for (index, element) in year.grades.enumerated() {
//                print("Grade \(index): \(element.grade)")
//                print("Half Credit \(index): \(element.isHalfCredit)")
//                print("Weight \(index): \(element.weight)")
//            }
//            print("GPA: ",year.calculateGpa())
        }
    }

}

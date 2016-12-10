//
//  Year.swift
//  GPAerFood
//
//  Created by Main Khan on 12/3/16.
//  Copyright © 2016 Main Khan. All rights reserved.
//

import UIKit

class Year: NSObject {
    
    // MARK: Properties
    
    var grades: [Grade]
    var gpa: Float?
    
    // MARK: Initialization
    
    init?(grades:[Grade]) {
        
        self.grades = grades
        super.init()
        self.gpa = calculateGpa()
        
        // Initialization should fail if there is no grades
        if(grades.isEmpty) {
            return nil
        }
        
    }
    
    override init() {
        self.grades = [Grade]()
        self.gpa = nil
    }
    
    // Calculates the GPA based on the self.grades property
    // if there is no grades, returns nil
    func calculateGpa() -> Float? {
        let numGrades = self.grades.count
        
        // if there are no grades in the array, keep GPA nil
        if (numGrades == 0) {
            return nil
        }
            
        // otherwise, average the grades and set the GPA
        var sum: Float = 0
        for grade in self.grades {
            sum = sum + grade.getWeightedGrade()
        }
        return (sum / Float(numGrades))
        
    }
}

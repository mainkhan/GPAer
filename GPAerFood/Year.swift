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
    var whatGrade: Int?
    
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
        self.whatGrade = nil
    }
    
    init(whatGrade: Int) {
        self.grades = [Grade]()
        self.gpa = nil
        self.whatGrade = whatGrade
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
        var numberOfCredits: Float = 0
        for grade in self.grades {
            sum = sum + grade.getWeightedGrade()
            if (grade.isHalfCredit == 0) {
                // is full credit
                numberOfCredits = numberOfCredits + Float(1.0)
            }
            else {
                // is half credit
                numberOfCredits = numberOfCredits + Float(0.5)
            }
        }
        
        return (sum / numberOfCredits)
        
    }
}

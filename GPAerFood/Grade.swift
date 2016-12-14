//
//  Grade.swift
//  GPAerFood
//
//  Created by Main Khan on 12/4/16.
//  Copyright © 2016 Main Khan. All rights reserved.
//

import UIKit

class Grade: NSObject {
    
    // MARK: Properties
    
    var grade: Float
    var weight: Int     // 0=regular, 1=Honors. 2=AP
    var isHalfCredit: Int // 0=full credit, 1=halfCredit

    init(grade:Float, weight:Int, isHalfCredit:Int) {
        self.grade = grade
        self.weight = weight
        self.isHalfCredit = isHalfCredit
    }
    
    init(grade:Float) {
        self.grade = grade
        self.weight = 0
        self.isHalfCredit = 0
    }
    
    override init() {
        self.grade = -1
        self.weight = 0
        self.isHalfCredit = 0
    }
    
    /**
     This function will return the weighted grade used for GPA calculations
     The weight factors in the "weight" of the grade (i.e. AP, Honors) 
     and if the grade is half credit or not
     */
    func getWeightedGrade() -> Float {
        var w = Float(0.0) // weight value init to 0
        
        if (weight == 1) {
            // Honors weight
            w = Float(5.0)
        }
        else if (weight == 2) {
            // AP weight
            w = Float(10.0)
        }
        
        if (isHalfCredit == 0) {
            // not half credit
            return (self.grade + w)
        }
        else {
            // is half credit
            return ((self.grade + w )/2)
        }
        
    }
    
    
}

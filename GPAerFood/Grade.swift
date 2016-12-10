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
    
    func getWeightedGrade() -> Float {
        // TODO: Change this to return the weighted grade
        return (self.grade)
        
    }
    
    
}

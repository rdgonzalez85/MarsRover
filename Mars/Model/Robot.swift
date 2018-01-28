//
//  Robot.swift
//  Mars
//
//  Created by Rodrigo Gonzalez on 27/01/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import Foundation

/**
 Basic class that represents a unit
 */

protocol Unit {
    /**
     The direction that the unit is facing (representation in degress).
    */
    var direction: Int {get set}
    
    /**
     The position where the unit is in.
    */
    var position : Point {get set}
    
    /**
     Initialize a new Unit with a given point and direction
     @param position The position of the unit.
     @param direction The direction where the unit is facing.
    */
    init(position: Point, direction: Int)
    
    /**
     Moves the unit to a new point.
     @param newPoint The point where the unit will move to.
    */
    mutating func moveTo(newPoint: Point)
}

struct Robot: Unit {
    var direction: Int
    var position : Point
    
    init(position: Point, direction: Int) {
        self.position = position
        self.direction = direction
    }
    
    mutating func moveTo(newPoint: Point) {
        position = newPoint
    }
}


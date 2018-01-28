//
//  Movement.swift
//  Mars
//
//  Created by Rodrigo Gonzalez on 27/01/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import Foundation

/**
 Basic point geometry class.
 */
struct Point: Equatable {
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    let x: Int
    let y: Int
    
}

/**
 Convenience class that controls the movement and aritmetic operations
 */
protocol Movement {
    /**
     Move from given point.
     @param point The point from where to move.
     @param angle The directoin where to move
     @returns The new point after executing the move.
     */
    func move(point: Point, toDirection angle: Int) -> Point
    
    /**
     Converts the given angle to a range 0 <= x < 360
     @param number The number to convert.
     @returns The angle converted
     */
    func toDegreess(number: Int) -> Int
    
    /**
     Converts the given direction (i.e. "N","E","S","W") to the corresponding angle.
     @param direction The direction (character)
     @returns The angle corresponding that direction
     */
    func directionFor(direction: Character) -> Int
}

struct CardinalMovement: Movement {
    
    // cardinal points
    private enum Direction {
        case N
        case S
        case E
        case W
    }
    
    // mapper for angle <--> cardinal point
    private let orientationDictionary : Dictionary<Int , Direction> = [
        0 : .N,
        90 : .E,
        180 : .S,
        270 : .W
    ]
    
    // mapper for character <--> angle
    private let directionMapper: Dictionary<Character,Int> = [
        "N" : 0,
        "E" : 90,
        "S" : 180,
        "W" : 270
    ]
    
    func move(point: Point, toDirection angle: Int) -> Point {
        var newX = point.x
        var newY = point.y
        if let direction = orientationDictionary[angle] {
            switch direction {
            case .N: newY += 1
            case .E: newX += 1
            case .S: newY -= 1
            case .W: newX -= 1
            }
        }
        
        return Point(x: newX, y: newY)
    }
    
    func toDegreess(number: Int) -> Int {
        var returnValue = number % 360
        
        if returnValue < 0 {
            returnValue += 360
        }
        
        return returnValue
    }
    
    func directionFor(direction: Character) -> Int {
        
        if let angle = directionMapper[direction] {
            return angle
        }
        
        return 0
    }
}


//
//  RobotCoordinator.swift
//  Mars
//
//  Created by Rodrigo Gonzalez on 27/01/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import Foundation

/**
  Coordinator that interprets operations and operates the robot
 */
protocol Coordinator {
    /**
     The unit to be coordinated
     */
    var robot: Unit {get set}
    
    /**
     The movement system that the coordinator uses
     */
    var movement: Movement {get set}
    
    /**
     Initialize a new Coordinator with a given x,y points and direction.
     @param x The initial x position of the unit.
     @param y The initial y position of the unit.
     @param position The initial position that the unit is facing to.
     */
    init(x: Int, y: Int, position: Character)
    
    /**
     Executes the given operation.
     @param operation The operation to be performed.
     */
    func performOperation(operation: Character)
}

class RobotCoordinator: Coordinator {
    var robot: Unit
    var movement: Movement
    
    required init(x: Int, y: Int, position: Character) {
        let point = Point(x:x, y:y)
        self.movement = CardinalMovement()
        let direction = movement.directionFor(direction: position)
        self.robot = Robot(position: point, direction: direction)
    }
    
    /**
     The posible operations that the Coordinator handles
     */
    private enum Operation {
        case rotate((Int) -> Int)
        case forward
    }
    
    // mapper operator <--> operation
    private lazy var operations: Dictionary<Character, Operation> = {
        return [
            "L" : Operation.rotate({ self.movement.toDegreess(number: $0 - 90) }),
            "R" : Operation.rotate({ self.movement.toDegreess(number: $0 + 90) }),
            "M" : Operation.forward
        ]
    }()
    
    
    func performOperation(operation: Character) {
        if let op = operations[operation] {
            switch op {
            case .rotate(let function):
                robot.direction = function(robot.direction)
            case .forward:
                let newPoint = movement.move(point: robot.position, toDirection: robot.direction)
                robot.moveTo(newPoint: newPoint)
            }
        } else {
            Swift.print("operation not supported: \(operation)")
        }
    }
}


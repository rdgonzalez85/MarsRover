//
//  RobotCoordinatorTests.swift
//  MarsTests
//
//  Created by Rodrigo Gonzalez on 28/01/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import XCTest

class RobotCoordinatorTests: XCTestCase {
    
    func testRobotMove1() {
        let x = 1
        let y = 2
        let position: Character = "N"
        let operations = "LMLMLMLMM"
        let finalPosition = Point(x:1,y:3)
        let finalDirection = 0 // N
        
        robotMove(x: x, y: y, position: position, operations: operations, finalPosition: finalPosition, finalDirection: finalDirection)
    }
    
    func testRobotMove2() {
        let x = 3
        let y = 3
        let position: Character = "E"
        let operations = "MMRMMRMRRM"
        let finalPosition = Point(x:5,y:1)
        let finalDirection = 90 // E
        
        robotMove(x: x, y: y, position: position, operations: operations, finalPosition: finalPosition, finalDirection: finalDirection)
    }
    
    private func robotMove(x:Int, y: Int, position: Character, operations: String, finalPosition: Point, finalDirection: Int) {
        
        let robotCoordinator = RobotCoordinator(x: x, y: y, position: position)
        for operation in operations {
            robotCoordinator.performOperation(operation: operation)
        }
        
        XCTAssertEqual(robotCoordinator.robot.position, finalPosition)
        XCTAssertEqual(robotCoordinator.robot.direction, finalDirection)
    }
}

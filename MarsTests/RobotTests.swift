//
//  RobotTests.swift
//  MarsTests
//
//  Created by Rodrigo Gonzalez on 27/01/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import XCTest
@testable import Mars

class RobotTests: XCTestCase {
    
    func testRobotMove() {
        let point = Point(x:0, y:0)
        var robot = Robot(position: point, direction: 0)

        let x = 3
        let y = 3
        
        let newPoint = Point(x:x, y:y)
        robot.moveTo(newPoint: newPoint)

        XCTAssert(robot.position.x == x)
        XCTAssert(robot.position.y == y)
    }
}

//
//  MovementTests.swift
//  MarsTests
//
//  Created by Rodrigo Gonzalez on 28/01/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import XCTest

class MovementTests: XCTestCase {
    
    var movement: Movement?
    
    override func setUp() {
        super.setUp()
        movement = CardinalMovement()
    }
    
    override func tearDown() {
        movement = nil
        super.tearDown()
    }
    
    func testRobotMove() {
        let x = 3
        let y = 3

        guard let newDirection = movement?.directionFor(direction: "W") else {
            XCTFail("a new direction should be returned")
            return
        }
        
        let newPoint = Point(x:x, y:y)
        
        let movePoint = movement?.move(point: newPoint, toDirection: newDirection)
        
        let expectedPoint = Point(x:2,y:3)
        XCTAssertEqual(expectedPoint, movePoint)
        
    }

    func testDirectionFor() {
        let input = Character("E")
        let angle = movement?.directionFor(direction: input)
        XCTAssertEqual(90, angle)
    }
}

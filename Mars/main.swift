//
//  main.swift
//  Mars
//
//  Created by Rodrigo Gonzalez on 27/01/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import Foundation

// example case with test values
func execute(x: Int, y: Int, position: Character, operations: String) {
    
    Swift.print("##### Starting operation #####")
    let robotCoordinator = RobotCoordinator(x: x, y: y, position: position)
    for operation in operations {
        robotCoordinator.performOperation(operation: operation)
    }
    Swift.print("##### Operation finished #####")
}

execute(x: 1, y: 2, position: "N", operations: "LMLMLMLMM")
execute(x: 3, y: 3, position: "E", operations: "MMRMMRMRRM")


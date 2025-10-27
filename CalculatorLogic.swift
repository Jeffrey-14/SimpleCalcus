//
//  CalculatorLogic.swift
//  SimpleCalcus
//
//  Created by Nana Yaw on 10/26/25.
//

import Foundation

class CalculatorLogic {
    func add(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
    
    func subtract(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
    
    func multiply(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
    
    func divide(_ a: Double, _ b: Double) throws -> Double {
        guard b != 0 else { throw NSError(domain: "Calculator", code: -1, userInfo: [NSLocalizedDescriptionKey: "Division by zero"]) }
        return a / b
    }
}

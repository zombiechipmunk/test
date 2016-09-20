//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Tea Jakić on 19/09/16.
//  Copyright © 2016 Tea Jakić. All rights reserved.
//

import Foundation
class CalculatorBrain{
	private var accumulator = 0.0
	func setOperand(operand: Double){
		accumulator = operand
	}
	func preformOperation(symbol :String) {
		switch symbol {
		case "π":
			accumulator = M_PI
		case "√":
			accumulator = sqrt(accumulator)
		default: break
		}}
	var result:Double {
		get {
			return accumulator
		}
	}
}

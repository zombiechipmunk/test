//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Tea Jakić on 19/09/16.
//  Copyright © 2016 Tea Jakić. All rights reserved.
//

import Foundation

func multiply (op1: Double, op2 : Double) -> Double {
	return op1 * op2
}

class CalculatorBrain
{
	private var accumulator = 0.0

	func setOperand(operand: Double){
		
		accumulator = operand
	}
	
	var operations: Dictionary<String,Operation> = [
		"π"		: Operation.Constant(M_PI),
		"e"		: Operation.Constant(M_E),
		"√"		: Operation.UnaryOperation(sqrt),
		"cos"	: Operation.UnaryOperation(cos),
		"×"		: Operation.BinaryOperation(multiply),
		"="		: Operation.Equals
 ]
	enum Operation {
		case Constant(Double)
		case UnaryOperation((Double) -> Double)
		case BinaryOperation((Double,Double)->Double)
		case Equals
	}
	func performOperation(symbol : String) {
		if let operation = operations[symbol] {
			switch operation {
			case .Constant(let value) : accumulator = value
			case .UnaryOperation(let function) : accumulator = function(accumulator)
			case .BinaryOperation(let function) : break
			case . Equals: break
			}
		}
	}
	var result:Double {
		get {
			return accumulator
		}
	}
}

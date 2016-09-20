//
//  ViewController.swift
//  Calculator
//
//  Created by Tea Jakić on 04/08/16.
//  Copyright © 2016 Tea Jakić. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet private weak var display: UILabel!
	
	private var userIsTyping = false
	
	@IBAction private func TouchDigit(_ sender: UIButton) {
		let digit = sender.currentTitle!
		if userIsTyping{
			let textCurrentlyInDisplay = display.text!
			display.text = textCurrentlyInDisplay + digit
		}else {
			display.text = digit
		}
		userIsTyping = true
	}
	private var displayValue:Double{
		get{
			return Double(display.text!)!
		}
		set{
			display.text = String(newValue)
			
		}
	}
	private var brain = CalculatorBrain()
	@IBAction private func preformOperation(_ sender: UIButton) {
		if userIsTyping {
			brain.setOperand(operand:displayValue)
			userIsTyping = false
		}
		if let mathematicalSymbol = sender.currentTitle {
			brain.preformOperation(symbol:mathematicalSymbol)
		}
		displayValue=brain.result
	}
	
	
	
}

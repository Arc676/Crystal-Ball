//
//  Backend.swift
//  Crystal Ball
//
//  Created by Alessandro Vinciguerra on 01/09/2017.
//  Copyright © 2017 Arc676. All rights reserved.
//


import Foundation

class Backend: NSObject {

	static let answerCount = 12

	static func locStr(_ key: String) -> String {
		return NSLocalizedString(key, comment: "")
	}

	static func askQ(log: String, question: String) -> String {
		var text = log
		let key = "ans" + String(arc4random_uniform(UInt32(Backend.answerCount)))
		text = text.appending("\nQ: \(question)\nA: \(Backend.locStr(key))")
		return text
	}

}

//
//  ViewController.swift
//  Crystal Ball Mac
//
//  Created by Alessandro Vinciguerra on 18/08/2017.
//  Copyright © 2017 Arc676. All rights reserved.
//

import Cocoa

class ViewControllerMac : NSViewController {

	@IBOutlet weak var questionField: NSTextField!
	@IBOutlet var transcript: NSTextView!

	override func viewDidLoad() {
		super.viewDidLoad()
		clearTranscript(NSNull())
	}

	@IBAction func askQuestion(_ sender: Any) {
		transcript.string = Backend.askQ(log: transcript.string, question: questionField.stringValue)
		transcript.scrollRangeToVisible(NSMakeRange(transcript.string.count - 1, 1))
	}

	@IBAction func clearTranscript(_ sender: Any) {
		transcript.string = Backend.locStr("transcript")
	}

}

//
//  ViewController.swift
//  Crystal Ball Mac
//
//  Created by Alessandro Vinciguerra on 2017-08-18.
//      <alesvinciguerra@gmail.com>
//Copyright (C) 2017-9 Arc676/Alessandro Vinciguerra

//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation (version 3)

//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with this program.  If not, see <http://www.gnu.org/licenses/>.
//See README and LICENSE for more details

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

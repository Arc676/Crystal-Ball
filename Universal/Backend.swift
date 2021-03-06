//
//  Backend.swift
//  Crystal Ball
//
//  Created by Alessandro Vinciguerra on 2017-01-09.
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

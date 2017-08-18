//
//  SettingsController.swift
//  Crystal Ball
//
//  Created by Alessandro Vinciguerra on 1/3/16.
//  Copyright © 2016 Arc676. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    @IBOutlet weak var en: UIButton!
    @IBOutlet weak var it: UIButton!
    @IBOutlet weak var zh: UIButton!
    @IBOutlet weak var fr: UIButton!
    @IBOutlet weak var de: UIButton!

    @IBOutlet weak var backButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.title = NSLocalizedString("BackButton", comment: "")
    }

    @IBAction func setLanguage(sender: UIButton) {
        var language = "en"
        if sender == it {
            language = "it"
        }else if sender == zh {
            language = "zh-Hans"
        }else if sender == fr {
            language = "fr"
        }else if sender == de {
            language = "de"
        }
        NSUserDefaults.standardUserDefaults().setObject([language], forKey: "AppleLanguages")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

}
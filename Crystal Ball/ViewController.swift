//
//  ViewController.swift
//  Crystal Ball
//
//  Created by Alessandro Vinciguerra on 12/31/15.
//  Copyright © 2015 Arc676. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var question: UITextField!
    @IBOutlet weak var log: UITextView!

    let answerCount = 12

    func locStr(_ key: String) -> String{
        return NSLocalizedString(key, comment: "")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        log.text = locStr("transcript")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let sud = UserDefaults.standard
        if !(sud.value(forKey: "LanguageConfirmed") as! Bool) {
            let lang = sud.value(forKey: "AppleLanguages")?.objectAtIndex(0) as! String
            if lang != NSLocalizedString("langCode", comment: "") {
                var okPressed = false
                let alert = UIAlertController(title: "Language Selection", message: locStr("changeLang"), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: locStr("No"), style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: locStr("Yes"), style: .default, handler: { _ in
                    sud.set([lang], forKey: "AppleLanguages")
                    sud.synchronize()
                    okPressed = true
                }))
                
                present(alert, animated: true, completion: nil)
                if okPressed{
                    let newalert = UIAlertController(title: "", message: locStr("changeLang2"), preferredStyle: .alert)
                    present(newalert, animated: true, completion: nil)
                }
            }
            sud.set(true, forKey: "LanguageConfirmed")
        }
    }
    
    @IBAction func openSettingsPane(_ sender: AnyObject) {
        let alert = UIAlertController(title: locStr("warning"), message: locStr("confirmLeave"), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: locStr("No"), style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: locStr("Yes"), style: .destructive, handler: { _ in
            NotificationCenter.default.post(name: Notification.Name(rawValue: "userDidEnterSettings"), object: nil)
            UIApplication.shared.openURL(URL(string: UIApplicationOpenSettingsURLString)!)
        }))
        present(alert, animated: true, completion: nil)
    }

    @IBAction func clearLog(_ sender: AnyObject) {
        log.text = locStr("transcript")
    }

    @IBAction func copyText(_ sender: AnyObject) {
        UIPasteboard.general.string = locStr("transcript") + "\n" + String(Date()) + "\n" + log.text
    }

    @IBAction func askQuestion(_ sender: AnyObject) {
        let text = NSMutableString(string: log.text);
        let key = "ans" + String(arc4random_uniform(UInt32(answerCount)))
        text.appendFormat("\nQ: %@\nA: %@", question.text!,
            locStr(key)
        )
        log.text = text as String
        question.text = ""
        question.resignFirstResponder()
        log.scrollRangeToVisible(NSMakeRange(log.text.characters.count - 1, 1))
    }

}

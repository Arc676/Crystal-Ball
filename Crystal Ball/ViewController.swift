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

    func locStr(key: String) -> String{
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

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let sud = NSUserDefaults.standardUserDefaults()
        if !(sud.valueForKey("LanguageConfirmed") as! Bool) {
            let lang = sud.valueForKey("AppleLanguages")?.objectAtIndex(0) as! String
            if lang != NSLocalizedString("langCode", comment: "") {
                var okPressed = false
                let alert = UIAlertController(title: "Language Selection", message: locStr("changeLang"), preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: locStr("No"), style: .Cancel, handler: nil))
                alert.addAction(UIAlertAction(title: locStr("Yes"), style: .Default, handler: { _ in
                    sud.setObject([lang], forKey: "AppleLanguages")
                    sud.synchronize()
                    okPressed = true
                }))
                
                presentViewController(alert, animated: true, completion: nil)
                if okPressed{
                    let newalert = UIAlertController(title: "", message: locStr("changeLang2"), preferredStyle: .Alert)
                    presentViewController(newalert, animated: true, completion: nil)
                }
            }
            sud.setObject(true, forKey: "LanguageConfirmed")
        }
    }
    
    @IBAction func openSettingsPane(sender: AnyObject) {
        let alert = UIAlertController(title: locStr("warning"), message: locStr("confirmLeave"), preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: locStr("No"), style: .Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: locStr("Yes"), style: .Destructive, handler: { _ in
            NSNotificationCenter.defaultCenter().postNotificationName("userDidEnterSettings", object: nil)
            UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
        }))
        presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func clearLog(sender: AnyObject) {
        log.text = locStr("transcript")
    }

    @IBAction func copyText(sender: AnyObject) {
        UIPasteboard.generalPasteboard().string = locStr("transcript") + "\n" + String(NSDate()) + "\n" + log.text
    }

    @IBAction func askQuestion(sender: AnyObject) {
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
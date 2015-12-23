//
//  TextInputViewController.swift
//  PLTL
//
//  Created by Edward Yoo on 12/22/15.
//  Copyright © 2015 Hohun Yoo. All rights reserved.
//

import UIKit
import MessageUI

class TextInputViewController: UIViewController {
  
  @IBOutlet weak var userInputTextView: UITextView!
  @IBOutlet weak var resultTextView: UITextView!
  let translator = Translator()
  
  override func viewDidLoad() {
      super.viewDidLoad()

  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
  }
    
  @IBAction func translateButtonAction(sender: AnyObject) {
    userInputTextView.resignFirstResponder()
    resultTextView.text = translator.toPigLatin(userInputTextView.text)
  }
  
  @IBAction func messageButtonAction(sender: AnyObject) {
    sendMessage()
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TextInputViewController: MFMessageComposeViewControllerDelegate {
  
  //to conform to the protocol- dismiss when message complete or when message cancelled.
  func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  //to send the message
  func sendMessage() {
    let messageViewController = MFMessageComposeViewController()
    
    messageViewController.body = resultTextView.text
    messageViewController.messageComposeDelegate = self
    
    self.presentViewController(messageViewController, animated: true, completion: nil)
  }
  
  
}

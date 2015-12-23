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
    userInputTextView.resignFirstResponder() //dismiss keyboard
    resultTextView.text = translator.toPigLatin(userInputTextView.text)
  }
  
  @IBAction func messageButtonAction(sender: AnyObject) {
    //calls the messageViewController
    if resultTextView.text.characters.count > 160 {
      //160 being the maximum length of an SMS
      presentErrorViewController("To send an SMS, your message must be below 160 characters!")
    } else if resultTextView.text.characters.count <= 0{
      presentErrorViewController("Your message doesn't have anything in it!")
    } else {
      sendMessage()
    }
  }
  
  override func prefersStatusBarHidden() -> Bool {
    return true
  }
  
  func presentErrorViewController(messageToDisplay: String) {
    let alertViewController = UIAlertController(title: "Error!", message: messageToDisplay, preferredStyle: .Alert)
    alertViewController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
    self.presentViewController(alertViewController, animated: true, completion: nil)
  }

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

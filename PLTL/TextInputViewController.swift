//
//  TextInputViewController.swift
//  PLTL
//
//  Created by Edward Yoo on 12/22/15.
//  Copyright © 2015 Hohun Yoo. All rights reserved.
//

import UIKit

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
    translator.toPigLatin(userInputTextView.text)
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

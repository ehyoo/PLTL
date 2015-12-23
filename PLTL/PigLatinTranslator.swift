//
//  PigLatinTranslator.swift
//  PLTL
//
//  Created by Edward Yoo on 12/22/15.
//  Copyright © 2015 Hohun Yoo. All rights reserved.
//

import Foundation

class Translator {
  
  func toPigLatin(stringToTranslate: String) -> String {
    
    let vowelArray = ["a", "e", "i", "o", "u"]
    let stringToTranslateArray = stringToTranslate.characters.split{$0 == " "}.map(String.init)
    var translatedArray: [String] = []
    var translatedWord = ""
    var finalTranslatedString = ""
    
    
    for word in stringToTranslateArray {
      
      var wordArray = word.characters.map { String($0) }
      
      if let _ = Int(wordArray[0]) {
        translatedArray.append(word)
        
      } else {
        
        if vowelArray.contains(wordArray[0]) {
          translatedWord = word + "yay"
          translatedArray.append(translatedWord)
        } else {
          let firstLetter = wordArray[0]
          wordArray.removeAtIndex(0)
          translatedWord = wordArray.joinWithSeparator("") + firstLetter + "ay"
          translatedArray.append(translatedWord)
        }
      }
    }
    
    finalTranslatedString = translatedArray.joinWithSeparator(" ")
    return finalTranslatedString
  }
  
}
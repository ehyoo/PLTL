//
//  PigLatinTranslator.swift
//  PLTL
//
//  Created by Edward Yoo on 12/22/15.
//  Copyright © 2015 Hohun Yoo. All rights reserved.
//

import Foundation

class Translator {
  
  let punctuationArray = []
  
  //split everything into chars
  //iterate through it:
  /*
  if x != letter or number {
  join beginning -> x to the index before the punctuation
  add to new array
  pop everything there
  } else {
  add to new array
  pop
  }
  
  join entire array and return.
  */
  
  func toPigLatin(stringToTranslate: String) -> String {
    
    var stringArray = stringToTranslate.characters.map { String($0) }
    var translatedArray: [String] = []
    let alphanumericCharacterSet = NSCharacterSet.alphanumericCharacterSet()
    var finalString = ""
    var lastKnownIndex = 0
    
    for i in 0..<stringArray.count {
      if let _ = stringArray[i].rangeOfCharacterFromSet(alphanumericCharacterSet) {
        
        if i == stringArray.count - 1 {
          
          let isolatedWordArray = stringArray[lastKnownIndex..<stringArray.count]
          let isolatedWord = isolatedWordArray.joinWithSeparator("")
          let pigLatinizedWord = pigLatinTranslator(isolatedWord)
          translatedArray.append(pigLatinizedWord)
        }
      } else {
        
        //takes all the characters up to the special character and combines them into an array
        //then adds to the translatedArray
        if i != lastKnownIndex + 1 {
          //if not the first character
          let isolatedWordArray = stringArray[lastKnownIndex..<i]
          let isolatedWord = isolatedWordArray.joinWithSeparator("")
          let pigLatinizedWord = pigLatinTranslator(isolatedWord)
          translatedArray.append(pigLatinizedWord)
          lastKnownIndex = i
          
          //add special character
          translatedArray.append(stringArray[i])
        } else {
          translatedArray.append(stringArray[i])
          lastKnownIndex = i
        }
      }
    }
    
    finalString = translatedArray.joinWithSeparator("")
    
    return finalString
  }
  
  func pigLatinTranslator(stringToTranslate: String) -> String {
    
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
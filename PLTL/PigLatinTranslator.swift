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
  
  func toPigLatin(stringToTranslate: String) -> String {
    //the main translation function in the class: returns the translated string of what's given.
    
    var stringArray = stringToTranslate.characters.map { String($0) } //separates string to array
    var translatedArray: [String] = []
    let alphanumericCharacterSet = NSCharacterSet.alphanumericCharacterSet()
    var translatedString = ""
    var lastKnownIndex = 0
    
    for i in 0..<stringArray.count {
      if let _ = stringArray[i].rangeOfCharacterFromSet(alphanumericCharacterSet) {
        //checks if the character in question is alphanumerical.
        if i == stringArray.count - 1 {
          //if i happens to be at the end of the array, combine the members in lastKnownArray to i to a word and translate.
          //if not, then continue on.
          let isolatedWordArray = stringArray[lastKnownIndex..<stringArray.count]
          let isolatedWord = isolatedWordArray.joinWithSeparator("")
          let pigLatinizedWord = pigLatinTranslator(isolatedWord)
          translatedArray.append(pigLatinizedWord)
        }
      } else {
        //if the member in question is a special character, takes all the characters up to the special character and combines them into an array
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
          //if special character is the first character inspected, then just add to array.
          translatedArray.append(stringArray[i])
          lastKnownIndex = i
        }
      }
    }
    
    translatedString = translatedArray.joinWithSeparator("")
    
    return translatedString
  }
  
  func pigLatinTranslator(stringToTranslate: String) -> String {
    //does the actual translating
    
    let vowelArray = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    let stringToTranslateArray = stringToTranslate.characters.split{$0 == " "}.map(String.init)
    var translatedArray: [String] = []
    var translatedWord = ""
    var finalTranslatedString = ""
    
    for word in stringToTranslateArray {
      var wordArray = word.characters.map { String($0) }
      
      if let _ = Int(wordArray[0]) {
        //checks if the first character is a number.
        translatedArray.append(word)
      } else {
        if vowelArray.contains(wordArray[0]) {
          //if vowel
          translatedWord = word + "yay"
          translatedArray.append(translatedWord)
        } else {
          //if consonant
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
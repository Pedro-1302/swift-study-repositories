import UIKit

let defaults = UserDefaults.standard

let dictionaryKey = "myDictionary"

let array = [1, 2, 3]
let dictionary = ["name": "Pedro"]

defaults.set(0.24, forKey: "Volume")
defaults.set(true, forKey: "MusicOn")
defaults.set(Date(), forKey: "AppLastOpenedByUser")
defaults.set(array, forKey: "myArray")
defaults.set(dictionary, forKey: dictionaryKey)

let volume = defaults.float(forKey: "Volume")
let appLastOpen = defaults.object(forKey: "AppLastOpenedByUser")
let myArray = defaults.array(forKey: "myArray") as! [Int]
let myDictionary = defaults.dictionary(forKey: dictionaryKey)?.first

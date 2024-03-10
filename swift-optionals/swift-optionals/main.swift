//
//  main.swift
//  swift-optionals
//
//  Created by Pedro Franco on 23/01/24.
//

import Foundation

// 1 - Force Unwrapping

let myOptionalWForceUnwrapping: String?

myOptionalWForceUnwrapping = "Pedro" // or nil

let text: String = myOptionalWForceUnwrapping! // not good, app have chance to crash

// 2 - Check for nil value

let nilOptional: String?

nilOptional = nil

if nilOptional != nil {
    let text: String = nilOptional!
} else {
    print("nilOptional was found to be nil. ")
}

// 3 - Optional Binding

let optionalBinding: String?

optionalBinding = "Pedro"

if let safeOptional = optionalBinding {
    let text: String = safeOptional
} else {
    // error
}

// 4 - Nil Coalescing Operator
let opt: String? = nil
let coalescing: String = opt ?? "if-optional-is-nil-use-this"

// 5 - Optional Chaining

struct MyOptional {
    var property = 123
    func method() {
        print("I'm the struct's method.")
    }
}
let structOptional: MyOptional?

structOptional = nil

print(structOptional?.property)

// 6 - guard let

let guardOptional: String? = nil

func guardLet() -> String? {
    guard let optionalIsntNil = guardOptional else {
        return "error"
    }
    
    return optionalIsntNil
}

let funcReturn = guardLet()








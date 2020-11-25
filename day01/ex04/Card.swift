//
//  Card.swift
//  ex01
//
//  Created by Захаров Василий on 25.11.2020.
//

import Foundation

class Card : NSObject {
    
    var color : Color
    var value : Value
    
    init(color : Color, value : Value) {
        self.color = color
        self.value = value
    }
    
    override var description: String {
        return ("color is \(self.color) and value is \(self.value)")
    }

    override func isEqual(_ object : Any?) -> Bool {
        if let object = object as? Card {
            return (object.value == self.value && object.value == self.value)
        }
        return (false)
    }
}

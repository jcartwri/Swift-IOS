//
//  Deck.swift
//  ex02
//
//  Created by Захаров Василий on 25.11.2020.
//

import Foundation

extension Array {
    mutating func shufleff() {
        for i in 0 ..< self.count {
            let j = Int(arc4random_uniform(UInt32(self.count)))
            if (i != j) {
                self.swapAt(i, j)
            }
        }
    }
}

class Deck : NSObject{
    
    static let allSpades : [Card] = Value.allValues.map({Card(color : Color.spade, value : $0)})
    static let allDiamonds : [Card] = Value.allValues.map({Card(color : Color.diamond, value : $0)})
    static let allHearts : [Card] = Value.allValues.map({Card(color : Color.heart, value : $0)})
    static let allClubs : [Card] = Value.allValues.map({Card(color : Color.club, value : $0)})
    static let allCards : [Card] = allSpades + allDiamonds + allHearts + allClubs
}

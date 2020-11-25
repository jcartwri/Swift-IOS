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

//    var flag : Bool
    var cards : [Card] = allCards
    var discards : [Card] = []
    var outs : [Card] = []

    init(_ flag: Bool) {
        if flag {
            self.cards.shufleff()
        }
    }
    
    override var description: String{
        var s = ""
        self.cards.forEach({s = s + "color is \($0.color) and value is \($0.value)\n"})
        return (s)
    }
    
    func draw() -> Card? {
        if cards.count > 0 {
            let card : Card = self.cards.removeFirst()
            self.outs.append(card)
            return (card)
        }
        return nil
    }
    
    func fold(c: Card) {
        var i : Int = 0
        for j in self.outs {
            if c == j {
                self.discards.append(c)
                self.outs.remove(at: i)
                break
            }
            i = i + 1
        }
    }
}

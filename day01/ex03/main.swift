//
//  main.swift
//  ex03
//
//  Created by Захаров Василий on 25.11.2020.
//

import Foundation
print("---------> Deck allClubs <-----------")
Deck.allClubs.forEach({print($0)})
print (Deck.allClubs.count)

print("---------> Deck allDiamonds <----------")
Deck.allDiamonds.forEach({print($0)})
print (Deck.allDiamonds.count)


print("---------> Deck allSpades <------------")
Deck.allSpades.forEach({print($0)})
print (Deck.allSpades.count)

print("---------> Deck allHearts <------------")
Deck.allHearts.forEach({print($0)})
print (Deck.allHearts.count)

print("---------> Deck allCards <------------")
Deck.allCards.forEach({print($0)})
print (Deck.allCards.count)


print ("--------> shuffle <--------")
var a : Array = [1, 2, 3, 4, 5, 6, 7, 8]
print (a)
a.shufleff()
print (a)


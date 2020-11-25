//
//  main.swift
//  ex05
//
//  Created by Захаров Василий on 25.11.2020.
//

import Foundation

print("Hello, World!")
var dc = Deck(true)
print(Deck.allCards)
print(dc.cards)
print("############")
print("element which draw:")
print(dc.draw())
print("value dc.outs is ")
print(dc.outs)
print("############")
print(dc.fold(c : dc.outs[0]))
print("value dc.outs is ")
print(dc.outs)
print("value dc.discards is ")
print(dc.discards)
print("############")


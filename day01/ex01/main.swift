//
//  main.swift
//  ex01
//
//  Created by Захаров Василий on 25.11.2020.
//

import Foundation

func ==(card_1 : Card, card_2 : Card) -> Bool {
    if (card_1.color == card_2.color && card_1.value == card_2.value) {
        return (true)
    }
    else{
        return (false)
    }
}

var card1 : Card = Card(color : Color.spade, value : Value.two)
var card2 : Card = Card(color : Color.spade, value : Value.two)
print (card1)
print (card2)
print (card1 == card2)


var card01 : Card = Card(color : Color.club, value : Value.two)
var card02 : Card = Card(color : Color.heart, value : Value.two)
print (card01)
print (card02)
print (card01 == card02)

var card11 : Card = Card(color : Color.spade, value : Value.ten)
var card22 : Card = Card(color : Color.spade, value : Value.two)
print (card11)
print (card22)
print (card11 == card22)

var card111 : Card = Card(color : Color.club, value : Value.four)
var card222 : Card = Card(color : Color.spade, value : Value.two)
print (card111)
print (card222)
print (card111 == card222)

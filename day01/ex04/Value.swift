//
//  Value.swift
//  ex00
//
//  Created by Захаров Василий on 25.11.2020.
//

import Foundation


public enum Value : Int {
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case sex = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case spade = 11
    case ace = 12
    case diamond = 13
    case club = 14
    public static let allValues : [Value] = [.two, .three, .four, .five, .sex, .seven, .eight, .nine, .ten, .spade, .ace, .diamond, .club]
}

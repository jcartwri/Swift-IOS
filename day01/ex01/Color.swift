//
//  Color.swift
//  ex00
//
//  Created by Захаров Василий on 25.11.2020.
//

import Foundation

public enum Color : String {
    case spade = "spade"
    case heart = "heart"
    case club = "club"
    case diamond = "diamond"
    public static let allColors : [Color] = [.spade, .heart, .club, .diamond]
}

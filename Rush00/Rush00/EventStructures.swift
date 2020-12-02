//
//  EventStructures.swift
//  Rush00
//
//  Created by Дмитрий on 29.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation

struct Event {
    let name: String
    let description: String
    let maxGuests: Int
    let nbrRegistred: Int
    let location: String
    let type: String
    let startTime: String
    let endTime: String
    let campuses: [Int]
    let cursuses: [Int]
    let duration: String
}

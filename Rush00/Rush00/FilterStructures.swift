//
//  File.swift
//  Rush00
//
//  Created by Joseth Cartwright on 11/29/20.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation

struct Cursus {
    let name: String
    let id: Int
    
}

struct Campus {
    let name: String
    let id: Int

}

class PickerData {
    static func getAllCursus() -> [Cursus] {
        [
            Cursus(name: "Basecamp WarmUp", id: 38),
            Cursus(name: "msk-test", id: 37),
            Cursus(name: "Basecamp", id: 36),
            Cursus(name: "Java piscine", id: 35),
            Cursus(name: "Data science piscine", id: 34),
            Cursus(name: "42tokyo-playground", id: 33),
            Cursus(name: "42 seoul events", id: 32),
            Cursus(name: "kor-test", id: 31),
            Cursus(name: "Reloaded", id: 28),
            Cursus(name: "RPA", id: 27),
            Cursus(name: "H2STest", id: 26),
            Cursus(name: "micropiscine-web-101", id: 25),
            Cursus(name: "python-101", id: 23),
            Cursus(name: "static-riddle-101", id: 22),
            Cursus(name: "42cursus", id: 21),
            Cursus(name: "Boost", id: 20),
            Cursus(name: "Atlantis", id: 19),
            Cursus(name: "Starfleet", id: 18),
            Cursus(name: "H2S", id: 17),
            Cursus(name: "X-Mansion-Namido", id: 16),
            Cursus(name: "X-Mansion", id: 15),
            Cursus(name: "Technical Interview", id: 14),
            Cursus(name: "42 Labs", id: 13),
            Cursus(name: "Créa", id: 12),
            Cursus(name: "BootCamp", id: 11),
            Cursus(name: "Formation Pole Emploi", id: 10),
            Cursus(name: "C Piscine", id: 9),
            Cursus(name: "WeThinkCode_", id: 8),
            Cursus(name: "Piscine C à distance", id: 7),
            Cursus(name: "Piscine C décloisonnée", id: 6)
        ]
    }
    
    static func getAllCampus() -> [Campus] {
        [
            Campus(name: "Barcelona", id: 46),
            Campus(name: "Alicante", id: 45),
            Campus(name: "Wolfsburg", id: 44),
            Campus(name: "Abu Dhabi", id: 43),
            Campus(name: "42Network", id: 42),
            Campus(name: "Nice", id: 41),
            Campus(name: "Urduliz", id: 40),
            Campus(name: "Heilbronn", id: 39),
            Campus(name: "Lisbon", id: 38),
            Campus(name: "Malaga", id: 37),
            Campus(name: "Adelaide", id: 36),
            Campus(name: "Amman", id: 35),
            Campus(name: "Kuala Lumpur", id: 34),
            Campus(name: "Bangkok", id: 33),
            Campus(name: "Yerevan", id: 32),
            Campus(name: "Angouleme", id: 31),
            Campus(name: "Rome", id: 30),
            Campus(name: "Seoul", id: 29),
            Campus(name: "Rio de Janeiro", id: 28),
            Campus(name: "Hack High School - Fremont", id: 27),
            Campus(name: "Tokyo", id: 26),
            Campus(name: "Quebec", id: 25),
            Campus(name: "Novosibirsk", id: 24),
            Campus(name: "Kazan", id: 23),
            Campus(name: "Madrid", id: 22),
            Campus(name: "Benguerir", id: 21),
            Campus(name: "São-Paulo", id: 20),
            Campus(name: "CoderDojoSV", id: 19),
            Campus(name: "iTouchUP", id: 18)
        ]
    }
    
    static func getAllKinds() -> [String] {
        return [
        "challenge",
        "hackathon",
        "event",
        "workshop",
        "conference",
        "meet_up",
        "association",
        "extern"
        ]
    }
}

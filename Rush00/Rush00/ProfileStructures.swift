//
//  ProfileStructures.swift
//  Rush00
//
//  Created by Дмитрий on 29.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import Foundation
import UIKit

struct Syllabus {
    let name: String
    let level: Float
}

struct User {
    let name: String
    let surname: String
    let login: String
    var image: UIImage?
    var curses: [Syllabus]
}

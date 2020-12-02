//
//  shape.swift
//  ex
//
//  Created by Захаров Василий on 02.12.2020.
//

import Foundation
import UIKit

class Shape : UIView {
    var kind : String = "square"
    var collType: UIDynamicItemCollisionBoundsType = .rectangle

//    let square : UIView
    
    override init(frame: CGRect) {
        super.init(frame: frame)

//        var self.color : UIColor
        switch arc4random_uniform(8) {
        case 0:
            self.backgroundColor = UIColor.red
        case 1:
            self.backgroundColor = UIColor.blue
        case 2:
            self.backgroundColor = UIColor.green
        case 3:
            self.backgroundColor = UIColor.gray
        case 4:
            self.backgroundColor = UIColor.yellow
        case 5:
            self.backgroundColor = UIColor.orange
        case 6:
            self.backgroundColor = UIColor.black
        case 7:
            self.backgroundColor = UIColor.purple
        default:
            self.backgroundColor = UIColor.gray
        }
        if arc4random_uniform(2) == 1 {
            self.kind = "circle"
            self.clipsToBounds = true
            self.collType = .ellipse
            self.layer.cornerRadius = self.frame.height / 2
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        if self.kind == "circle" {
            return .ellipse
        }
        else {
            return .rectangle
        }
    }
    
    
    
    
//    override var bounds: CGRect {
//        get { return super.bounds }
//        set(newBounds) {
//            super.bounds = newBounds
//            if self.kind == "Circle" {
//                layer.cornerRadius = newBounds.size.width / 2.0
//                self.collType = .ellipse
//            }
//        }
//    }
}

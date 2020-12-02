//
//  ViewController.swift
//  ex
//
//  Created by Захаров Василий on 02.12.2020.
//

import UIKit

class ViewController: UIViewController {
    var need_shape : Shape?
    var mas_shape = [Shape]()
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(gesture:)))
        view.addGestureRecognizer(gesture)
        let hgesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture(gesture:)))
        view.addGestureRecognizer(hgesture)
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotateGesture(gesture:)))
        view.addGestureRecognizer(rotateGesture)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            print("\(sender.location(in: view))")
            addOnView(sender.location(in: view))
        default:
            break
        }
    }
    
    func addOnView(_ point : CGPoint) {
        let shape = Shape(frame: CGRect(x: point.x, y: point.y, width: 100, height: 100))
        
        self.mas_shape.append(shape)
        self.view.addSubview(shape)
        include_gravity_animator()
    }
    
    func include_gravity_animator() {
        self.animator = UIDynamicAnimator(referenceView: view)
        self.gravity = UIGravityBehavior(items: self.mas_shape)
        self.animator.addBehavior(self.gravity)
        self.collision = UICollisionBehavior(items: mas_shape)
        self.collision.translatesReferenceBoundsIntoBoundary = true
        self.animator.addBehavior(collision)
    }
    
    @objc func panGesture(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            for i in 0 ..< self.mas_shape.count {
                if mas_shape[i].layer.presentation()?.frame.contains(gesture.location(in: self.view)) == true {
                    self.need_shape = mas_shape.remove(at: i)
                    break
                }
            }
            print("Began")
        case .changed:
            if self.need_shape != nil {
                self.collision.removeItem(need_shape!)
                self.need_shape!.center = gesture.location(in: self.view)
                self.gravity.removeItem(self.need_shape!)
                self.collision.addItem(need_shape!)
                print("Changed to \(gesture.location(in: view))")
            }
        case .ended:
//            self.gravity.addItem(self.need_shape!)
            if self.need_shape != nil {
                mas_shape.append(need_shape!)
                include_gravity_animator()
                self.need_shape = nil
            }
            print("Ended")
        case .failed:
            print("Failed or Cancelled")
        case .possible:
            print("Possible")
        default:
            print("Trying to be exhaustive")
        }
    }
    
    @objc func pinchGesture(gesture: UIPinchGestureRecognizer) {
        var begin_scale : CGFloat = 1
        switch gesture.state {
        case .began:
            for i in 0 ..< self.mas_shape.count {
                if mas_shape[i].layer.presentation()?.frame.contains(gesture.location(in: self.view)) == true {
                    self.need_shape = mas_shape.remove(at: i)
                    break
                }
            }
            if self.need_shape != nil {
                collision.removeItem(need_shape!)
                gravity.removeItem(need_shape!)
                self.view.bringSubviewToFront(need_shape!)
                begin_scale = gesture.scale
            }
            print("Begand pinchGesture")
        case .changed:
            if self.need_shape != nil {
                self.collision.removeItem(need_shape!)
                self.need_shape?.bounds.size = CGSize(width: 100 * gesture.scale / begin_scale, height: 100 * gesture.scale / begin_scale)
                self.animator.updateItem(usingCurrentState: need_shape!)
                self.collision.addItem(need_shape!)
            }
//            print("Changed to \(gesture.location(in: view))")
            print("Changed to \(gesture.location(in: view))")
        case .ended:
            if self.need_shape != nil {
                mas_shape.append(need_shape!)
                include_gravity_animator()
                self.need_shape = nil
            }
            print("Ended pinchGesture")
        case .failed:
            print("Failed or Cancelled")
        case .possible:
            print("Possible")
        default:
            print("Trying to be exhaustived")
        }
    }
    
    @objc func rotateGesture(gesture: UIRotationGestureRecognizer) {
        switch gesture.state {
        case .began:
//            let tapLocation = gesture.location(in: self.view)
            for i in 0 ..< self.mas_shape.count {
                if mas_shape[i].layer.presentation()?.frame.contains(gesture.location(in: self.view)) == true {
                    self.need_shape = mas_shape.remove(at: i)
                    break
                }
            }
            if self.need_shape != nil {
                collision.removeItem(need_shape!)
                gravity.removeItem(need_shape!)
                self.view.bringSubviewToFront(need_shape!)
            }
        case .changed:
            if need_shape != nil {
                collision.removeItem(need_shape!)
                need_shape!.transform = need_shape!.transform.rotated(by: gesture.rotation)
                animator.updateItem(usingCurrentState: need_shape!)
                gesture.rotation = 0
                collision.addItem(need_shape!)
            }
        case .ended:
            if self.need_shape != nil {
                mas_shape.append(need_shape!)
                include_gravity_animator()
                self.need_shape = nil
            }
            print("Ended pinchGesture")
        default:
            print("Trying to be exhaustived")
        }
    }


}


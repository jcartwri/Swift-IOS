//
//  ViewController.swift
//  ex02
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label_text: UILabel!
    
    var a : Double = 0
    var b : Double = 0
    var opratr = ""
    
    @IBAction func action_button_eval(_ sender: Any) {
        print("It's equallly (=)")
        if let availabelNil = label_text.text {
            if let b1 = Double(availabelNil) {
                b = b1
            }
        }
        if opratr == "+" {
            label_text.text = String(format: "%0.3f", (a + b))
            a = a + b
        }
        else if opratr == "*" {
            label_text.text = String(format: "%0.3f", (a * b))
            a = a * b
        }
        else if opratr == "-" {
            label_text.text = String(format: "%0.3f", (a - b))
            a = a - b
        }
        else if opratr == "/" {
            if b != 0 {
                label_text.text = String(format: "%0.3f", (a / b))
                a = a / b
            }
            else {
                label_text.text = "Не определено"
                a = 0
            }
        }
        b = 0
    }
    
    @IBAction func action_button_diff(_ sender: Any) {
        print("It's diff (/)")
        opratr = "/"
        if let availabelNil = label_text.text {
            if let a1 = Double(availabelNil) {
                a = a1
                print("a is \(a)")
            }
        }
        label_text.text = "0"
    }
    
    @IBAction func action_button_minus(_ sender: Any) {
        print("It's minus (-)")
        opratr = "-"
        if let availabelNil = label_text.text {
            if let a1 = Double(availabelNil) {
                a = a1
            }
        }
        label_text.text = "0"
    }
    
    @IBAction func action_button_multi(_ sender: Any) {
        print("It's multiplication (*)")
        opratr = "*"
        if let availabelNil = label_text.text {
            if let a1 = Double(availabelNil) {
                a = a1
            }
        }
        label_text.text = "0"
    }
    
    @IBAction func action_button_plus(_ sender: Any) {
        print("It's plus (+)")
        opratr = "+"
        if let availabelNil = label_text.text {
            if let a1 = Double(availabelNil) {
                a = a1
            }
        }
        label_text.text = "0"
    }
    
    @IBAction func action_button_NEG(_ sender: Any) {
        print("It's negativ (-1 * ...)")
        if let availabelNil = label_text.text {
            if let c1 = Double(availabelNil) {
                label_text.text = String(format: "%0.3f", -c1)
            }
        }
        
    }
    
    @IBAction func action_button_AC(_ sender: Any) {
        print("It's new clear fild (AC)")
        a = 0
        b = 0
        opratr = ""
        label_text.text = "0"
    }
    
    @IBAction func action_button_0(_ sender: Any) {
        print("It's 0")
        if let availabelNil = label_text.text {
            if label_text.text == "Не определено" {
                label_text.text = "0"
            }
            else if availabelNil != "0" {
                label_text.text = availabelNil + "0"
            }
        }
    }
    
    @IBAction func action_button_9(_ sender: Any) {
        print("It's 9")
        if let availabelNil = label_text.text {
            if label_text.text == "Не определено" {
                label_text.text = "9"
            }
            else if availabelNil == "0" {
                label_text.text = "9"
            }
            else {
                label_text.text = availabelNil + "9"
            }
        }
    }
    
    @IBAction func action_button_8(_ sender: Any) {
        print("It's 8")
        if let availabelNil = label_text.text {
            if label_text.text == "Не определено" {
                label_text.text = "8"
            }
            else if availabelNil == "0" {
                label_text.text = "8"
            }
            else {
                label_text.text = availabelNil + "8"
            }
        }
    }
    
    @IBAction func action_button_7(_ sender: Any) {
        print("It's 7")
        if let availabelNil = label_text.text {
            if label_text.text == "Не определено" {
                label_text.text = "7"
            }
            else if availabelNil == "0" {
                label_text.text = "7"
            }
            else {
                label_text.text = availabelNil + "7"
            }
        }
    }
    
    @IBAction func action_6_button(_ sender: Any) {
        print("It's 6")
        if let availabelNil = label_text.text {
            if label_text.text == "Не определено" {
                label_text.text = "6"
            }
            else if availabelNil == "0" {
                label_text.text = "6"
            }
            else {
                label_text.text = availabelNil + "6"
            }
        }
    }
    
    @IBAction func action_5_button(_ sender: Any) {
        print("It's 5")
        if let availabelNil = label_text.text {
            if label_text.text == "Не определено" {
                label_text.text = "5"
            }
            else if availabelNil == "0" {
                label_text.text = "5"
            }
            else {
                label_text.text = availabelNil + "5"
            }
        }
    }
    
    @IBAction func action_button_4(_ sender: Any) {
        print("It's 4")
        if let availabelNil = label_text.text {
            if label_text.text == "Не определено" {
                label_text.text = "4"
            }
            else if availabelNil == "0" {
                label_text.text = "4"
            }
            else {
                label_text.text = availabelNil + "4"
            }
        }
    }
    
    @IBAction func action_button_3(_ sender: Any) {
        print("It's 3")
        if let availabelNil = label_text.text {
            if label_text.text == "Не определено" {
                label_text.text = "3"
            }
            else if availabelNil == "0" {
                label_text.text = "3"
            }
            else {
                label_text.text = availabelNil + "3"
            }
        }
    }
    
    @IBAction func action_button_2(_ sender: Any) {
        print("It's 2")
        if let availabelNil = label_text.text {
            if label_text.text == "Не определено" {
                label_text.text = "2"
            }
            else if availabelNil == "0" {
                label_text.text = "2"
            }
            else {
                label_text.text = availabelNil + "2"
            }
        }
    }
    
    @IBAction func action_button_1(_ sender: Any) {
        print("It's 1")
        if let availabelNil = label_text.text {
            if label_text.text == "Не определено" {
                label_text.text = "1"
            }
            else if availabelNil == "0" {
                label_text.text = "1"
            }
            else {
                label_text.text = availabelNil + "1"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


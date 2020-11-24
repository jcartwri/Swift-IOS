//
//  ViewController.swift
//  ex02
//
//  Created by Захаров Василий on 24.11.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label_text: UILabel!
    
    @IBAction func action_button_eval(_ sender: Any) {
        print("It's equallly (=)")
    }
    
    @IBAction func action_button_diff(_ sender: Any) {
        print("It's diff (/)")
    }
    
    @IBAction func action_button_minus(_ sender: Any) {
        print("It's minus (-)")
    }
    
    @IBAction func action_button_multi(_ sender: Any) {
        print("It's multiplication (*)")
    }
    
    @IBAction func action_button_plus(_ sender: Any) {
        print("It's plus (+)")
    }
    
    @IBAction func action_button_NEG(_ sender: Any) {
        print("It's negativ (-1 * ...)")
    }
    
    @IBAction func action_button_AC(_ sender: Any) {
        print("It's new clear fild (AC)")
    }
    
    @IBAction func action_button_0(_ sender: Any) {
        label_text.text = "0"
        print("It's 0")
    }
    
    @IBAction func action_button_9(_ sender: Any) {
        label_text.text = "9"
        print("It's 9")
    }
    
    @IBAction func action_button_8(_ sender: Any) {
        label_text.text = "8"
        print("It's 8")
    }
    
    @IBAction func action_button_7(_ sender: Any) {
        label_text.text = "7"
        print("It's 7")
    }
    
    @IBAction func action_5_button(_ sender: Any) {
        label_text.text = "5"
        print("It's 5")
    }
    
    @IBAction func action_6_button(_ sender: Any) {
        label_text.text = "6"
        print("It's 6")
    }
    
    @IBAction func action_button_4(_ sender: Any) {
        label_text.text = "4"
        print("It's 4")
    }
    
    @IBAction func action_button_3(_ sender: Any) {
        label_text.text = "3"
        print("It's 3")
    }
    
    @IBAction func action_button_2(_ sender: Any) {
        label_text.text = "2"
        print("It's 2")
    }
    
    @IBAction func action_button_1(_ sender: Any) {
        label_text.text = "1"
        print("It's 1")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


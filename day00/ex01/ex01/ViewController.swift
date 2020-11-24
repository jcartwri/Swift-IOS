//
//  ViewController.swift
//  ex01
//
//  Created by Захаров Василий on 24.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text_label: UILabel!
    
    
    @IBAction func button_action(_ sender: Any) {
        if text_label.text == "World Hello !" {
            text_label.text = "Hello World !"
        }
        else {
            text_label.text = "World Hello !"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


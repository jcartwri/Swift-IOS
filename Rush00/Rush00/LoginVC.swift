//
//  LoginVC.swift
//  Rush00
//
//  Created by Дмитрий on 28.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON

class LoginVC: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBAction func LoginButtonTapped() {
        if UserDefaults.standard.bool(forKey: "isAuthorised") {
            let vc = EventsVC.storyboardInstance()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = WebVC.storyboardInstance()
            present(vc, animated: true)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        title = "Login"
        
        setup(button: loginButton)
    }
    
    private func setup(button: UIButton) {
        button.layer.cornerRadius = 10
    }


}


//
//  ViewController.swift
//  ex00
//
//  Created by Захаров Василий on 30.11.2020.
//

import UIKit

//Москва    55.755773 C Ш   37.617761 В Д

struct Place {
    var name : [String] = ["42 Ecole", "21 school"]
    var coordinat : Double
}

var name : [String] = ["42 Ecole", "21 school", "Krym"]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = name[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


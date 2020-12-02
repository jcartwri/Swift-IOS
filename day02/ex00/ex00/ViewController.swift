//
//  ViewController.swift
//  ex00
//
//  Created by Захаров Василий on 26.11.2020.
//

import UIKit

struct Data {
    static let name : [(String, String)] = [
        ("Яша", "21 год (05/09/1999) студент школы 21 и Мирэа"),
        ("Вася", "20 лет (23/10/2000) студент школы 21 и РГГРУ"),
        ("Ефим", "18 лет (01/03/2003) просто школьник!")
    ]
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.name.count
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIndex", for: indexPath)
        cell.textLabel?.text = Data.name[indexPath.row].0
        cell.detailTextLabel?.text = Data.name[indexPath.row].1
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(Data.name[indexPath.row].1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


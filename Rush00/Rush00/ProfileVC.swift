//
//  ProfileVC.swift
//  Rush00
//
//  Created by Дмитрий on 29.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

let hardcodedPickerData: [Syllabus] = [
    Syllabus(name: "42", level: 11.11),
    Syllabus(name: "Piscine C", level: 3.06),
    Syllabus(name: "42 cursus", level: 11.57)
]

class ProfileVC: UIViewController {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var syllabusLevel: UILabel!
    @IBOutlet weak var syllabusPicker: UIPickerView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    let apiManager: IAPIMeneger = APIManager()
    
    var syllabuses: [Syllabus] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My profile"
        
        setupLogoutButton()
        
        apiManager.getUserData { [weak self] (newUserData) in
            if let data = newUserData {
                DispatchQueue.main.async {
                    self?.updateUserInfo(newData: data)
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let cornerRadius = profileImage.bounds.height / 3
        profileImage.layer.cornerRadius = cornerRadius
        
        
    }
    
    private func setupLogoutButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "LogOut", style: .plain, target: self, action: #selector(logoutTapped))
    }
    
    @objc private func logoutTapped() {
        let ac = UIAlertController(title: "Log Out", message: "Are you sure?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { [weak self] (_) in
            let ud = UserDefaults.standard
            ud.set("", forKey: "accessToken")
            ud.set("", forKey:"refreshToken")
            ud.set(false, forKey: "isAuthorised")
            self?.navigationController?.popToRootViewController(animated: true)
        }))
        present(ac, animated: true)
        
    }
    
    private func updateUserInfo(newData data: User) {
        nameLabel.text = "Name: \(data.name)"
        surnameLabel.text = "Surname: \(data.surname)"
        loginLabel.text = "Login: \(data.login)"
        profileImage.image = data.image
        syllabuses = data.curses
        picker.reloadAllComponents()
        setupPicker()
    }
    
    private func setupPicker() {
        let currentCursus = hardcodedPickerData.count / 2
        syllabusPicker.selectRow(currentCursus, inComponent: 0, animated: false)
        syllabusLevel.text = String(format: "%.2f" , syllabuses[currentCursus].level)
    }

}

extension ProfileVC {
    static func storyboardInstance() -> ProfileVC {
        guard let vc = UIStoryboard(name: String(describing: self), bundle: nil).instantiateInitialViewController() as? ProfileVC else { fatalError() }
        return vc
    }
}

extension ProfileVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        syllabuses.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hardcodedPickerData[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        syllabusLevel.text = String(format: "%.2f", syllabuses[row].level)
    }
    
    
}

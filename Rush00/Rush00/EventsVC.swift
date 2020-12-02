//
//  EventsTVC.swift
//  Rush00
//
//  Created by Дмитрий on 29.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

class EventsVC: UIViewController {
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let apiManager: IAPIMeneger = APIManager()
    var eventsForShowing: [Event] = []
    var allEvents: [Event] = []
    let kinds = PickerData.getAllKinds()
    let cursus = PickerData.getAllCursus()
    let campuses = PickerData.getAllCampus()

    @IBAction func showAllEvents() {
        eventsForShowing = allEvents
        tableView.reloadData()
    }
    @IBAction func filterButtonTapped(_ sender: UIButton) {
        
        let kind = kinds[picker.selectedRow(inComponent: 0)]
        let cursusId = cursus[picker.selectedRow(inComponent: 1)].id
        let campusId = campuses[picker.selectedRow(inComponent: 2)].id

        getFiltredData(kind: kind, campus: campusId, cursus: cursusId)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Events"
        navigationController?.navigationBar.isHidden = false
        setupBarButtons()
        
        apiManager.getAllEvents { [weak self] (events) in
            if let events = events {
                self?.allEvents = events
                self?.eventsForShowing = events
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    private func setupBarButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(showProfileInfo))
        navigationItem.hidesBackButton = true
    }
    
    @objc private func showProfileInfo() {
        let vc = ProfileVC.storyboardInstance()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func getFiltredData(kind: String, campus: Int, cursus: Int) {
        var filtredEvents = [Event]()
        for event in allEvents {
            if event.type == kind &&
            event.cursuses.firstIndex(of: cursus) != nil {
                _ = event.campuses.firstIndex(of: campus)
                filtredEvents.append(event)
            }
        }
        eventsForShowing = filtredEvents
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension EventsVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return kinds.count
        } else if component == 1 {
            return cursus.count
        } else {
            return campuses.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return kinds[row]
        } else if component == 1 {
            return cursus[row].name
        } else {
            return campuses[row].name
        }
    }
    
    
}

extension EventsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentEvent = eventsForShowing[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        cell.textLabel?.text = """
        Event:
        Name: \(currentEvent.name)
        Description: \(currentEvent.description)
        Localisation: \(currentEvent.location)
        Max acceptors: \(currentEvent.maxGuests == 0 ? "not limited" : String(currentEvent.maxGuests))
        Registred now: \(currentEvent.nbrRegistred)
        Type: \(currentEvent.type)
        Start at: \(currentEvent.startTime)
        End at: \(currentEvent.endTime)
        Duration: \(currentEvent.duration)
        """
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsForShowing.count
    }
}

extension EventsVC {
    static func storyboardInstance() -> EventsVC {
        guard let vc = UIStoryboard(name: String(describing: self), bundle: nil).instantiateInitialViewController() as? EventsVC else { fatalError() }
        return vc
    }
}

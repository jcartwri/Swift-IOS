//
//  AnotherViewController.swift
//  ex00
//
//  Created by Захаров Василий on 30.11.2020.
//

import UIKit
import MapKit
//import CoreLocation

class AnotherViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 55.755773, longitude: 37.617761)
        map.addAnnotation(annontation)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

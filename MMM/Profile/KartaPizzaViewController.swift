//
//  KartaPizzaViewController.swift
//  MMM
//
//  Created by Sergei Kovalev on 15.04.2022.
//

import UIKit
import MapKit
import CoreLocation
class KartaPizzaViewController: UIViewController, MKMapViewDelegate {

    
    
    @IBOutlet weak var KartaP: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    
    
    
    struct Stadium {
      var name: String
      var lattitude: CLLocationDegrees
      var longtitude: CLLocationDegrees
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let stadiums = [Stadium(name: "Пиццерия 1", lattitude: 55.78641, longtitude: 37.58639),
                        Stadium(name: "Пиццери 2", lattitude: 55.75845, longtitude: 37.65457)]
        
        
        
          //checkLocationServices()
          fetchStadiumsOnMap(stadiums)
        
        
        // Do any additional setup after loading the view.
    }
    

    
    func fetchStadiumsOnMap(_ stadiums: [Stadium]) {
      for stadium in stadiums {
        let annotations = MKPointAnnotation()
        annotations.title = stadium.name
        annotations.coordinate = CLLocationCoordinate2D(latitude:
          stadium.lattitude, longitude: stadium.longtitude)
          KartaP.addAnnotation(annotations)
      }
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

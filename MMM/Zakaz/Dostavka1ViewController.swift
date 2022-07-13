//
//  Dostavka1ViewController.swift
//  list1
//
//  Created by Sergei Kovalev on 28.01.2022.
//

import UIKit
import MapKit
import CoreLocation


class Dostavka1ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var lat1: Double = 0
    var lon1: Double = 0
    
    //var profile: Profile = Profile()
    struct Stadium {
      var name: String
      var lattitude: CLLocationDegrees
      var longtitude: CLLocationDegrees
    }
    var geocoder = CLGeocoder()

    override func viewDidLoad() {
      super.viewDidLoad()
        /*let stadiums = [Stadium(name: "Emirates Stadium", lattitude: 51.5549, longtitude: -0.108436),
        Stadium(name: "Stamford Bridge", lattitude: 51.4816, longtitude: -0.191034),
        Stadium(name: "White Hart Lane", lattitude: 51.6033, longtitude: -0.065684),
        Stadium(name: "Old Trafford", lattitude: 53.4631, longtitude: -2.29139),
        Stadium(name: "Anfield", lattitude: 53.4308, longtitude: -2.96096)]*/
        
        self.locationManager.requestWhenInUseAuthorization()
        
        mapView.delegate = self
        
        let address = address
        var addr: String = address
        print("hht\(addr)")

        
        
        geocoder.geocodeAddressString(addr) {
            placemarks, error in
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            print("Lat: \(lat), Lon: \(lon)")

            let sourceLocation = CLLocationCoordinate2D(latitude: 55.78661, longitude: 37.58643)
            let destinationLocation = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
                
                // 3.
                let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
                let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
                
                // 4.
                let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
                let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
                
                // 5.
                let sourceAnnotation = MKPointAnnotation()
                sourceAnnotation.title = "Пиццерия"
                
                if let location = sourcePlacemark.location {
                  sourceAnnotation.coordinate = location.coordinate
                }
                
                
                let destinationAnnotation = MKPointAnnotation()
                destinationAnnotation.title = "Ваш Адресs"
                
                if let location = destinationPlacemark.location {
                  destinationAnnotation.coordinate = location.coordinate
                }
                
                // 6.
                self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )
            
            self.showRouteOnMap(pickupCoordinate: sourceLocation, destinationCoordinate: destinationLocation)
            
        }
        
        
        
        
        
        
    }
    
    
    
    func showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {

            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: pickupCoordinate, addressDictionary: nil))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate, addressDictionary: nil))
            request.requestsAlternateRoutes = true
            request.transportType = .automobile

            let directions = MKDirections(request: request)

            directions.calculate { [unowned self] response, error in
                guard let unwrappedResponse = response else { return }
                
                //for getting just one route
                if let route = unwrappedResponse.routes.first {
                    //show on map
                    self.mapView.addOverlay(route.polyline)
                    //set the map area to show the route
                    self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets.init(top: 80.0, left: 20.0, bottom: 100.0, right: 20.0), animated: true)
                }

            }
        }

    
    
    
    //this delegate function is for displaying the route overlay and styling it
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
         let renderer = MKPolylineRenderer(overlay: overlay)
         renderer.strokeColor = UIColor.red
         renderer.lineWidth = 5.0
         return renderer
    }
    
    
    
    func checkLocationServices() {
      if CLLocationManager.locationServicesEnabled() {
        checkLocationAuthorization()
      } else {
        // Show alert letting the user know they have to turn this on.
      }
    }
    func checkLocationAuthorization() {
      switch CLLocationManager.authorizationStatus() {
      case .authorizedWhenInUse:
        mapView.showsUserLocation = true
       case .denied: // Show alert telling users how to turn on permissions
       break
      case .notDetermined:
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
      case .restricted: // Show an alert letting them know what’s up
       break
      case .authorizedAlways:
       break
      }
    }
    
    func fetchStadiumsOnMap(_ stadiums: [Stadium]) {
      for stadium in stadiums {
        let annotations = MKPointAnnotation()
        annotations.title = stadium.name
        annotations.coordinate = CLLocationCoordinate2D(latitude:
          stadium.lattitude, longitude: stadium.longtitude)
        mapView.addAnnotation(annotations)
      }
    }

    let p = 0
    
    
    
    @IBAction func unwindToMap(unwindSegue: UIStoryboardSegue) {

    }
    
    
    
}

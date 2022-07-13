//
//  MapLocation.swift
//  list1
//
//  Created by Sergei Kovalev on 28.01.2022.
//

import UIKit
import MapKit
struct MapLocation: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

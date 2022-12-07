//
//  AirportPin.swift
//  CityAirport
//
//  Created by Поляндий on 07.12.2022.
//

import Foundation
import UIKit
import MapKit

class AirportPin: NSObject, MKAnnotation {

    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D

    init(
        name: String,
        city: String = "",
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = name
        self.subtitle = city
        self.coordinate = coordinate
    }
}

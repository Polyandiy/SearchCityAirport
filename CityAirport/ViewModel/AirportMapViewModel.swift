//
//  AirportMapViewPresentable.swift
//  CityAirport
//
//  Created by Поляндий on 07.12.2022.
//

import Foundation

protocol AirportMapViewPresentable {

    var airport: (name: String, city: String) { get }
    var currentLocation: (lat: Double, lon: Double) { get }
    var airportLocation: (lat: Double, lon: Double) { get }
}

struct AirportMapViewModel: AirportMapViewPresentable {
    
    var airport: (name: String, city: String)
    var currentLocation: (lat: Double, lon: Double)
    var airportLocation: (lat: Double, lon: Double)
}

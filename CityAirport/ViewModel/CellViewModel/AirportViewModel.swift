//
//  AirportViewModel.swift
//  CityAirport
//
//  Created by Поляндий on 07.12.2022.
//

import Foundation
import CoreLocation

protocol AirportViewPresentable {
    var name: String { get }
    var code: String { get }
    var address: String { get } // country
    var distance: Double? { get }
    var formattedDistance: String { get }
    var runwayLength: String { get }
    var location: (lat: String, lon: String) { get }
}

struct AirportViewModel: AirportViewPresentable {

    var name: String

    var code: String

    var address: String

    var distance: Double?

    var formattedDistance: String {
        let formatted = (distance ?? 0 * 1.6 / 1000).rounded(.up)
        return "\(formatted) Km"
    }

    var runwayLength: String

    var location: (lat: String, lon: String)
}

// MARK: -Extension: init
extension AirportViewModel {

    /// Accepting model and convert into viewModel
    init(usingModel model: AirportModel,
         currentLocation: (lat: Double, lon: Double)
    ) {
        self.name = model.name
        self.code = model.code
        self.address = "\(model.state ?? ""), \(model.country ?? "NA")"
        self.runwayLength = "Runway Length: \(model.runwayLength ?? "NA")"
        self.location = (lat: model.lat, lon: model.lon)
        // MARK: FIXME - Distancing calculation from current location to airport
        self.distance = getDistance(airportLocation: (lat: Double(model.lat) ?? 0.0,
                                                      lon: Double(model.lon) ?? 0.0),
                                    currentLocation: currentLocation)
    }
}

// MARK: -Extension: private
private extension AirportViewModel {

    func getDistance(airportLocation: (lat: Double, lon: Double),
                     currentLocation: (lat: Double, lon: Double)) -> Double? {

        let current = CLLocation(latitude: currentLocation.lat,
                                 longitude: currentLocation.lon)

        let airport = CLLocation(latitude: airportLocation.lat,
                                 longitude: airportLocation.lon)

        return current.distance(from: airport)
    }
}

// MARK: -Extension
extension AirportViewModel: Comparable {
    static func < (lhs: AirportViewModel, rhs: AirportViewModel) -> Bool {
        return lhs.distance ?? 0 < rhs.distance ?? 0
    }

    static func == (lhs: AirportViewModel, rhs: AirportViewModel) -> Bool {
        return lhs.code == rhs.code
    }
}

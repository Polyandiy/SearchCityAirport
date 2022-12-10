//
//  AirportApiProtocol.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import RxSwift

/// API Interface
protocol AirportAPI {
    func fetchAirports() -> Single<AirportsResponse>
}

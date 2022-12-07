//
//  AirportApiProtocol.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import RxSwift

protocol AirportApiProtocol {
    func fetchAirports() -> Single<AirportsResponse>
}

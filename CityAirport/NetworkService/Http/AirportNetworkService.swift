//
//  AirportNetworkService.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import Alamofire

class AirportNetworkService: NetworkService {
    var sessionManager: Session = Session.default
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return sessionManager.request(urlRequest).validate(statusCode: 200..<400)
    }
}

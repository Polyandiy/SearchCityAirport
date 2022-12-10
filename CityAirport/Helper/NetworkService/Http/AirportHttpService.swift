//
//  AirportNetworkService.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import Alamofire

class AirportHttpService: HttpService {
    var sessionManager: Session = Session.default

    func request(_ urlReqeust: URLRequestConvertible) -> DataRequest {
        return sessionManager.request(urlReqeust)
            .validate(statusCode: 200..<400)
    }
}

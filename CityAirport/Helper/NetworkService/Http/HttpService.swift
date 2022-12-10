//
//  NetworkService.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import Alamofire

/// Session and Request
protocol HttpService {
    var sessionManager: Session { get set }
    func request(_ urlReqeust: URLRequestConvertible) -> DataRequest
}

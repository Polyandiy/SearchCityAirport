//
//  NetworkService.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import Alamofire

protocol NetworkService {
    var sessionManager: Session { get set }
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest
}

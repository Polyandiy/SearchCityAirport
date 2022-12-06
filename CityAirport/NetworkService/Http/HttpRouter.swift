//
//  HttpRouter.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import Alamofire

protocol HttpRouter {
    var baseUrlString: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var headers: HTTPHeaders? {get}
    var parameters: Parameters? {get}
    
    func body() throws -> Data?
    
    func request(usingNetworkService service: NetworkService) throws -> DataRequest
}

extension HttpRouter {
    
    var parameters: Parameters? {return nil}
    var headers: HTTPHeaders? {return nil}
    func body() throws -> Data? {return nil}
    
    func asUrlRequest() throws -> URLRequest {
        var url = try baseUrlString.asURL()
        url.appendPathComponent(path)

        var request = try URLRequest(url: url, method: method, headers: headers)
        request.httpBody = try body()
        return request
    }

    func request(usingNetworkService service: NetworkService) throws -> DataRequest {
        return try service.request(asUrlRequest())
    }
}

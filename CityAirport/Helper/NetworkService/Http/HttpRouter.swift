//
//  HttpRouter.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import Alamofire

/// Router interface
protocol HttpRouter {

    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var params: Parameters? { get }
    func body() throws -> Data?

    func request(usingHttpService service: HttpService) throws -> DataRequest
}

extension HttpRouter {

    var headers: HTTPHeaders? { return nil }
    var params: Parameters? { return nil }
    func body() throws -> Data? { return nil }

    func asUrlRequest() throws -> URLRequest {
        var url = try baseUrl.asURL()
        url.appendPathComponent(path)

        var request = try URLRequest(url: url, method: method, headers: headers)
        request.httpBody = try body()
        return request
    }

    func request(usingHttpService service: HttpService) throws -> DataRequest {
        return try service.request(asUrlRequest())
    }
}

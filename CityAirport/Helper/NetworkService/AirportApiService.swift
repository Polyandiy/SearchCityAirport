//
//  AirportApiService.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import RxSwift
import Alamofire

enum CustomError: Error {
    case error(message: String)
}

class AirportApiService {
    private lazy var httpService = AirportNetworkService()
    static let shared: AirportApiService = AirportApiService()
}

extension AirportApiService: AirportApiProtocol {
    
    func fetchAirports() -> Single<AirportsResponse> {
        return Single.create { single -> Disposable in
            do {
                try AirportHttpRouter.getAirports
                    .request(usingNetworkService: self.httpService)
                    .responseJSON { result in
                        
                        do {
                            let airports = try AirportApiService.parseAirports(result: result)
                            single(.success(airports))
                        }
                        catch {
                            single(.failure(error))
                            print("failed to parse data")
                        }
                    }
            }
            catch {
                single(.failure(CustomError.error(message: "Airport Fetch Failed")))
            }
            return Disposables.create()
        }
    }
}

extension AirportApiService {
    static func parseAirports(result: AFDataResponse<Any>) throws -> AirportsResponse {
        guard let data = result.data,
              let airportResponse = try? JSONDecoder().decode(AirportsResponse.self, from: data) else {
            throw CustomError.error(message: "Invalid Airport JSON")
        }
        return airportResponse
    }
}

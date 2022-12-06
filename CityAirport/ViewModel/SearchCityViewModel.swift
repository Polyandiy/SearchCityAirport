//
//  SearchCityViewModel.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import RxCocoa
import RxSwift

protocol SearchCityVMProtocol {
    
    typealias Input = (
        searchText: Driver<String>, ()
    )
    typealias Output = ()
    typealias ViewModelBuilder = (SearchCityVMProtocol.Input) -> SearchCityVMProtocol
    
    var input: SearchCityVMProtocol.Input { get }
    var output: SearchCityVMProtocol.Output { get }
}

class SearchCityViewModel: SearchCityVMProtocol {
    
    var input: SearchCityVMProtocol.Input
    var output: SearchCityVMProtocol.Output
    private var airportService: AirportApiProtocol
    let bag = DisposeBag()
    
    init(input: SearchCityVMProtocol.Input, airportService: AirportApiProtocol) {
        self.input = input
        self.output = SearchCityViewModel.output(input: self.input)
        self.airportService = airportService
    }
}

private extension SearchCityViewModel {
    static func output(input: SearchCityVMProtocol.Input) -> SearchCityVMProtocol.Output {
        return ()
    }
    
    func process() -> Void {
//        self.airportService.fetchAirports()
//            .map({ (airports) in
//                print("airports: \(airports)")
//            })
//            .subscribe().disposed(by: bag )
        self.airportService
            .fetchAirports()
            .map({ (airports) in
                print("airports: \(airports)")
            })
            .subscribe()
            .disposed(by: bag)
    }
}

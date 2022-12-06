//
//  SearchCityViewModel.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import Foundation
import RxCocoa

protocol SearchCityVMProtocol {
    //var searchText: Driver<String> { get }
    
    typealias Input = (
        searchText: Driver<String>, ()
    )
    typealias Output = ()
    
    var input: SearchCityVMProtocol.Input { get }
    var output: SearchCityVMProtocol.Output { get }
}

class SearchCityViewModel: SearchCityVMProtocol {
    
    var input: SearchCityVMProtocol.Input
    var output: SearchCityVMProtocol.Output
    
    init(input: SearchCityVMProtocol.Input) {
        self.input = input
        self.output = SearchCityViewModel.output(input: self.input)
    }
}

private extension SearchCityViewModel {
    static func output(input: SearchCityVMProtocol.Input) -> SearchCityVMProtocol.Output {
        return ()
    }
}

//
//  CityViewModel.swift
//  CityAirport
//
//  Created by Поляндий on 07.12.2022.
//

import Foundation
import RxDataSources

/// sections and data for UITableView
typealias CityItemsSection = SectionModel<Int, CityViewModel>

protocol CityViewPresentable {
    var city: String { get }
    var location: String { get }
}

/// tableview cell view model
struct CityViewModel: CityViewPresentable {

    var city: String
    var location: String
}

extension CityViewModel {

    init(model: AirportModel) {
        self.city = model.city ?? ""
        self.location = "\(model.state ?? ""), \(model.country ?? "")"
    }
}

extension CityViewModel: Equatable {

    static func == (lhs: CityViewModel, rhs: CityViewModel) -> Bool {
        return lhs.city == rhs.city
    }
}

extension CityViewModel: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(city)
    }
}

//
//  CoordinatorProtocol.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import Foundation

protocol CoordinatorProtocol: class {
    
    var childCoordinators : [CoordinatorProtocol] { get set }
    
    func start()
}

extension CoordinatorProtocol {
    
    func add(coordinator: CoordinatorProtocol) -> Void {
        childCoordinators.append(coordinator)
    }
    
    func remove(coordinator: CoordinatorProtocol) -> Void {
        childCoordinators = childCoordinators.filter({ $0 !== coordinator})
    }
}

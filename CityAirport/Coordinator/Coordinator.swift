//
//  CoordinatorProtocol.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import Foundation

protocol Coordinator: AnyObject {

    var childCoordinator: [Coordinator] { get set }

    func start()
}

extension Coordinator {
    /// add coordinator to child coordinator
    func add(coordinator: Coordinator) {
        childCoordinator.append(coordinator)
    }

    /// remove coordinator from child coordinator
    func remove(coordinator: Coordinator) {
        childCoordinator = childCoordinator.filter { $0 !== coordinator }
    }
}

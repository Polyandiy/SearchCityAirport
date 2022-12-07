//
//  Routing.swift
//  CityAirport
//
//  Created by Поляндий on 07.12.2022.
//

import Foundation

typealias NavigationBackClosure = (() -> ())

protocol Routing {
    /// Push a viewController which implements Drawable
    func push(_ drawable: Drawable, isAnimated: Bool, onNavigationBack: NavigationBackClosure?)

    /// Pop a viewController
    func pop(_ isAnimated: Bool)

    /// Pop to the rootViewController
    func popToRoot(_ isAnimated: Bool)

    /// Present a viewController which implements Drawable
    func present(_ drawable: Drawable, isAnimated: Bool, onDismiss: NavigationBackClosure?)
}

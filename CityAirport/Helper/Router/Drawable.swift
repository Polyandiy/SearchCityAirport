//
//  Drawable.swift
//  CityAirport
//
//  Created by Поляндий on 07.12.2022.
//

import Foundation
import UIKit
/**
[Credit](https://benoitpasquier.com/coordinator-pattern-navigation-back-button-swift)
 */

protocol Drawable {
    var viewController: UIViewController? { get }
}

extension UIViewController: Drawable {

    var viewController: UIViewController? {
        return self
    }
}

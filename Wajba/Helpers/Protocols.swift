//
//  Protocols.swift
//  Wajba
//
//  Created by C4Q on 1/28/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import Foundation

protocol HomeControllerDelegate: class {
    func slideOutMenuToggled()
}

protocol LoginControllerDelegate: class {
    func finishLoggingIn()
    func finishLoggingOut()
}

//
//  ProfileRouter.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 17/05/22.
//

import Foundation

protocol AnyProfileRouter {
    static func start() -> ProfileRouter
}

class ProfileRouter: AnyProfileRouter {
    static func start() -> ProfileRouter {
        let router = ProfileRouter()
        
        
        
        return router
    }
}

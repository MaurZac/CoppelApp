//
//  ProfileRouter.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 17/05/22.
//

import UIKit

typealias proEntryPoint = AnyProfileView & UIViewController

protocol AnyProfileRouter {
    var entry: proEntryPoint? { get }
    static func start() -> AnyProfileRouter
}

class ProfileRouter: AnyProfileRouter {
    var entry: proEntryPoint?
    
    static func start() -> AnyProfileRouter {
        let router = ProfileRouter()
        
        var view: AnyProfileView = ProfileViewController()
        var presenter: AnyProfilePresenter = ProfilePresenter()
        var interactor: AnyProfileInteractor = ProfileInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? proEntryPoint
    
        
        return router
    }
}

//
//  Router.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 03/05/22.
//

import Foundation
import UIKit

typealias HomeEntryPoint = HomeAnyView & UIViewController

protocol HomeAnyRouter {
    var entry: HomeEntryPoint? { get }
    static func start() -> HomeAnyRouter
}

class HomeRouter: HomeAnyRouter {
    var entry: HomeEntryPoint?
    

    static func start() -> HomeAnyRouter {
        let router = HomeRouter()
        
        //Assign VIP
        var view: HomeAnyView = HomeViewController()
        var presenter: HomeAnyPresenter = HomePresenter()
        var interactor: HomeAnyInteractor = HomeInteractor()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? HomeEntryPoint
        
        return router
    }
}

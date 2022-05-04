//
//  Router.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 02/05/22.
//

import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}

class LogRouter: AnyRouter {
    var entry: EntryPoint?
    var window: UIWindow?

    static func start() -> AnyRouter {
        let router = LogRouter()
        
        //Assign VIP
        var view: AnyView = LogViewController()
        var presenter: AnyPresenter = LogPresenter()
        var interactor: AnyInteractor = LogInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
     
}

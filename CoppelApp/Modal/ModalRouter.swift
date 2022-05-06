//
//  ModalRouter.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 05/05/22.
//

import UIKit

typealias ModalEntryPoint = ModalAnyView & UIViewController

protocol ModalAnyRouter {
    var entry: ModalEntryPoint? { get }
    static func start() -> ModalAnyRouter
}

class ModalRouter: ModalAnyRouter {
    var entry: ModalEntryPoint?
    

    static func start() -> ModalAnyRouter {
        let router = ModalRouter()
        
        //Assign VIP
        var view: ModalAnyView = ModalViewController()
        var presenter: ModalAnyPresenter = ModalPresenter()
        var interactor: ModalAnyInteractor = ModalInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? ModalEntryPoint
        
        return router
    }
}

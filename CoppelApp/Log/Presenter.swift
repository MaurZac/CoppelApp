//
//  Presenter.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 02/05/22.
//

import Foundation
import UIKit

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}

    func interactorDidFetchUser(with result: Result<[LogEntity], Error>)
}

class LogPresenter: AnyPresenter {
    
    var user: String = ""
    var pass: String = ""
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    var view: AnyView?
    
//    func viewDidLoad() {
//        interactor?.getUser()
//        print("presenterEntry")
//    }
    
    func interactorDidFetchUser(with result: Result<[LogEntity], Error>) {
        switch result {
        case .success(let token):
            view?.update(with: token)
        case .failure:
            view?.update(with: "Something went wrong")
        }
    }
    
}

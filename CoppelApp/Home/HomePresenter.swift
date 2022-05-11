//
//  Presenter.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 03/05/22.
//

import Foundation

enum HomeFetchError: Error {
    case failed
}

protocol HomeAnyPresenter {
    var router: HomeAnyRouter? { get set }
    var interactor: HomeAnyInteractor? { get set }
    var view: HomeAnyView? { get set }

    func interactorDidFetchUser(with result: Result<Welcome, Error>)
}

class HomePresenter: HomeAnyPresenter {
   
    
    var router: HomeAnyRouter?
    var interactor: HomeAnyInteractor? {
        didSet{
            interactor?.getMovies()
        }
    }
    var view: HomeAnyView?
    
    func interactorDidFetchUser(with result: Result<Welcome, Error>) {
        switch result {
        case .success(let resu):
            view?.update(with: [resu])
        case .failure:
            view?.update(with: "Todo mal")
        }
    }
    
  
}

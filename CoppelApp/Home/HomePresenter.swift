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
    var router: HomeAnyRouter? {get set}
    var interactor: HomeAnyInteractor? {get set}
    var view: HomeAnyView? {get set}

    func interactorDidFetchUser(with result: Result<[LogEntity], Error>)
}

class HomePresenter: HomeAnyPresenter {
    func interactorDidFetchUser(with result: Result<[LogEntity], Error>) {
        print("result")
    }
    

    var router: HomeAnyRouter?
    
    var interactor: HomeAnyInteractor?
    
    var view: HomeAnyView?
}

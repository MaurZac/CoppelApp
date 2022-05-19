//
//  ProfilePresenter.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 17/05/22.
//

import Foundation

enum fetchError: Error{
    case failed
}

protocol AnyProfilePresenter{
    var router: AnyProfileRouter? { get set }
    var interactor: AnyProfileInteractor? { get set}
    var view: AnyProfileView? { get set }
    
    func interactorUpdateProfile(with result: Result<[Welcome], Error>)
}

class ProfilePresenter: AnyProfilePresenter {
    
    var router: AnyProfileRouter?
    
    var interactor: AnyProfileInteractor?{
        didSet{
            interactor?.getProfile()
        }
    }
    
    var view: AnyProfileView?

    func interactorUpdateProfile(with result: Result<[Welcome], Error>) {
        switch result {
        case .success(let res):
            view?.moviesList(with: res)
        case .failure:
            view?.movieError(with: "algo salio mal")
        }
    }
}

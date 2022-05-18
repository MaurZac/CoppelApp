//
//  ProfilePresenter.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 17/05/22.
//

import Foundation

protocol AnyProfilePresenter{
    var router: AnyProfileRouter? { get set }
    var interactor: AnyProfileInteractor? { get set}
    var view: AnyProfileView? { get set }
    
    func interactorUpdateProfile(with result: Result<[ProfileEntity], Error>)
}

class ProfilePresenter: AnyProfilePresenter {
    
    var router: AnyProfileRouter?
    
    var interactor: AnyProfileInteractor?
    
    var view: AnyProfileView?
    
    func interactorUpdateProfile(with result: Result<[ProfileEntity], Error>) {
        print("petition request")
    }
}

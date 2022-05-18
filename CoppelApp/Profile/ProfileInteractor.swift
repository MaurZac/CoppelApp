//
//  ProfileInteractor.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 17/05/22.
//

import Foundation

protocol AnyProfileInteractor {
    var presenter: AnyProfilePresenter? { get set }
    func getProfile()
}

class ProfileInteractor: AnyProfileInteractor {
    
    var presenter: AnyProfilePresenter?
    
    func getProfile() {
        
    }
    
}

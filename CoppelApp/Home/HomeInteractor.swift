//
//  Interactor.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 03/05/22.
//

import Foundation


protocol HomeAnyInteractor {
    var presenter: HomeAnyPresenter? {get set}
    func getToken()
   
}
class HomeInteractor: HomeAnyInteractor {
    var presenter: HomeAnyPresenter?
    
    func getToken() {
        print("lol")
    }
    
}

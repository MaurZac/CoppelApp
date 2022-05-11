//
//  ModalPresenter.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 05/05/22.
//

import Foundation

enum ModalFetchError: Error {
    case failed
}

protocol ModalAnyPresenter {
    var router: ModalAnyRouter? { get set }
    var interactor: ModalAnyInteractor? { get set }
    var view: ModalAnyView? { get set }

}

class ModalPresenter: ModalAnyPresenter {
   
    
    var router: ModalAnyRouter?
    var interactor: ModalAnyInteractor?
    var view: ModalAnyView?
    
}
  

//
//  ModalInteractor.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 05/05/22.
//

import Foundation

protocol ModalAnyInteractor {
    var presenter: ModalAnyPresenter? {get set}
    
}

class ModalInteractor: ModalAnyInteractor {

    var presenter: ModalAnyPresenter?
    var text1: String = ""
    
}

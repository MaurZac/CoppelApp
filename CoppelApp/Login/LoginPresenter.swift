//
//  LoginPresenter.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 30/04/22.
//  
//

import Foundation

class LoginPresenter  {
    
    // MARK: Properties
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    var wireFrame: LoginWireFrameProtocol?
}

extension LoginPresenter: LoginPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        print("presenterEntry")
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    // TODO: implement interactor output methods
}

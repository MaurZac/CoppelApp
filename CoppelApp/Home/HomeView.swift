//
//  View.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 03/05/22.
//

import Foundation
import UIKit

protocol HomeAnyView {
    var presenter: HomeAnyPresenter? {get set}
    func update(with user: [LogEntity])
    func update(with error: String)
}

class HomeViewController: UIViewController, HomeAnyView{
    func update(with user: [LogEntity]) {
        print("update")
    }
    
    func update(with error: String) {
        print("error")
    }
    
    
    var presenter: HomeAnyPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}

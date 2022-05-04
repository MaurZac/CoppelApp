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
    
    let segmentMenu: UISegmentedControl = {
        let segmenu = UISegmentedControl()
        
        return segmenu
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        view.backgroundColor = .systemGray6
        title = "TV Shows"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(systemName: "list.dash"), for: .normal)
        button.addTarget(self, action:#selector(callMethod), for: .touchDown)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItems = [barButton]
        
    }
    
    @objc func callMethod(){
        print("lolismo")
    }
    
    
    
}

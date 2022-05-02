//
//  LoginView.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 30/04/22.
//  
//

import Foundation
import UIKit

class LoginView: UIViewController {
    
    

    // MARK: Properties
    var presenter: LoginPresenterProtocol?
    var loginV: UIView!
    
    private let bgImage: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "mr-ro")
        return background
    }()
    
    let userTField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = .blue
        tf.textColor = .green
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.autocorrectionType = .no
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let passTField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = .blue
        tf.textColor = .green
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.autocorrectionType = .no
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let loginBtn: UIButton = {
        let button = UIButton()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), ]))
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 80/255, green: 151/255, blue: 164/255, alpha: 1).cgColor
        return button
    }()
    
    func mainStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [userTField,passTField,loginBtn])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.backgroundColor = .brown
        return stackView
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        presenter?.viewDidLoad()
        setupViewContraints()
    }
    
    
   
    
    func setupViewContraints(){
        let stackV = mainStackView()
        stackV.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bgImage)
        view.addSubview(stackV)
        
//        view.addSubview(userTField)
//        view.addSubview(passTField)
//        view.addSubview(loginBtn)
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        bgImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bgImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bgImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bgImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stackV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        stackV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        stackV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        stackV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        userTField.heightAnchor.constraint(equalTo: self.userTField.heightAnchor, constant: 40).isActive = true
        userTField.widthAnchor.constraint(equalTo: self.userTField.widthAnchor, constant: 100).isActive = true
        passTField.heightAnchor.constraint(equalTo: self.passTField.heightAnchor, constant: 40).isActive = true
        passTField.widthAnchor.constraint(equalTo: self.passTField.widthAnchor, constant: 100).isActive = true
        loginBtn.heightAnchor.constraint(equalTo: self.loginBtn.heightAnchor, constant: 50).isActive = true
    }

   
}

extension LoginView: LoginViewProtocol {
    // TODO: implement view output methods
    
}


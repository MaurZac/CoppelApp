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
    
    let imageIcon: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "unnamed")
        //background.frame = CGRect(x: 150, y: 150, width: 100, height: 100)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.contentMode = .scaleAspectFit
        return background
    }()
    
    let userTField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 0.2)
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.autocorrectionType = .no
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(white: 1, alpha: 0.5)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let passTField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 0.2)
        tf.textColor = .black
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.autocorrectionType = .no
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(white: 1, alpha: 0.5)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let loginBtn: UIButton = {
        let button = UIButton()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Log in", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), ]))
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 5
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 80/255, green: 151/255, blue: 164/255, alpha: 1).cgColor
        button.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        return button
    }()
    
    func mainStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [userTField,passTField,loginBtn])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        return stackView
    }
    let lblError: UILabel = {
        let lblError = UILabel()
        lblError.font = UIFont.systemFont(ofSize: 14)
        lblError.textColor = .red
        lblError.translatesAutoresizingMaskIntoConstraints = false
        lblError.textAlignment = .center
        lblError.text = "Error"
        return lblError
    }()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        //presenter?.viewDidLoad()
        setupViewContraints()
        lblError.isHidden = true
    }
    
    @objc private func goToLogin() {
        if userTField.text == "" || passTField.text == "" {
            lblError.isHidden = false
            lblError.text = "Los campos no pueden ir vacios"
        }else{
            lblError.isHidden = true
        }
    }
    
   
    
    func setupViewContraints(){
        let stackV = mainStackView()
        stackV.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bgImage)
        view.addSubview(stackV)
        view.addSubview(lblError)
        view.addSubview(imageIcon)
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        bgImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bgImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bgImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bgImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageIcon.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        stackV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 270).isActive = true
        stackV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        stackV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        stackV.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
       imageIcon.centerXAnchor.constraint(equalTo: stackV.centerXAnchor, constant: 0).isActive = true
        imageIcon.leftAnchor.constraint(equalTo: stackV.leftAnchor, constant: 50).isActive = true
        imageIcon.rightAnchor.constraint(equalTo: stackV.rightAnchor, constant: -50).isActive = true
        imageIcon.bottomAnchor.constraint(equalTo: stackV.topAnchor, constant: -30).isActive = true
        
        lblError.topAnchor.constraint(equalTo: stackV.bottomAnchor, constant: 10).isActive = true
        lblError.centerXAnchor.constraint(equalTo: stackV.centerXAnchor, constant: 0).isActive = true
    }

   
}

extension LoginView: LoginViewProtocol {
    // TODO: implement view output methods
    
}



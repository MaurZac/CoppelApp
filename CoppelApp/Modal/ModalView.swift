//
//  ModalView.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 05/05/22.
//

import Foundation
import UIKit


protocol ModalAnyView {
    var presenter: ModalAnyPresenter? {get set}
    func update(with resul: [Welcome])
    func update(with error: String)
}


class ModalViewController: UIViewController, ModalAnyView {
    var presenter: ModalAnyPresenter?
    var texto1: String = ""
    var imgPath1: String = ""
    func update(with resul: [Welcome]) {
        print("lol")
    }
    
    func update(with error: String) {
        texto1 = error
    }
    
    
    
    var containerView: UIView = {
           let view = UIView()
           view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 240/255, green: 150/255, blue: 5/255, alpha: 1).cgColor
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    
    let closeBtn: UIButton = {
        let button = UIButton()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Close", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), ]))
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor(red: 240/255, green: 150/255, blue: 5/255, alpha: 1).cgColor
        button.addTarget(self, action: #selector(goClose), for: .touchDown)
        return button
    }()
    
    let myImg: UIImageView = {
       let imageV = UIImageView()
        imageV.backgroundColor = UIColor.black
        imageV.image = UIImage(named: "mr-ro")
        imageV.layer.cornerRadius = 30
        imageV.clipsToBounds = true
        imageV.contentMode = .scaleToFill
        imageV.translatesAutoresizingMaskIntoConstraints = false
    return imageV
   }()
    
    let myLbl: UILabel = {
       let label = UILabel()
       label.text = "texto1"
       label.font = UIFont.systemFont(ofSize: 16)
       label.textColor = UIColor.green
       label.backgroundColor = .black
       label.numberOfLines = 2
       label.lineBreakMode = .byWordWrapping
       label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
       return label
   }()
    
    @objc func goClose(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        print("aquiva\(texto1)")
        
        setupViewContraints()
    }
    
    func setupViewContraints() {
        
        view.addSubview(containerView)
        containerView.addSubview(closeBtn)
        containerView.addSubview(myImg)
        containerView.addSubview(myLbl)
        
        closeBtn.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 45).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 25).isActive = true
        closeBtn.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10).isActive = true
        
        myImg.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).isActive = true
        myImg.widthAnchor.constraint(equalToConstant: 160).isActive = true
        myImg.heightAnchor.constraint(equalToConstant: 220).isActive = true
        myImg.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        myImg.downloaded(from: imgPath1)
        
        myLbl.topAnchor.constraint(equalTo: myImg.bottomAnchor, constant: 5).isActive = true
        myLbl.widthAnchor.constraint(equalToConstant: 160).isActive = true
        myLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        myLbl.centerXAnchor.constraint(equalTo: myImg.centerXAnchor, constant: 0).isActive = true
        myLbl.text = texto1
        
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true

        containerView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 450).isActive = true
   
    }

}


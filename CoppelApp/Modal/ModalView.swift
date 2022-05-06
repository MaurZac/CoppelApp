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
    var texto1 = "", texto2 = "", texto4 = ""
    var texto3: Double = 0.0
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
       label.font = UIFont.systemFont(ofSize: 14)
       label.textColor = UIColor.green
       label.numberOfLines = 2
       label.lineBreakMode = .byWordWrapping
       label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
       return label
   }()
    
    let rate: UILabel = {
       let label = UILabel()
       label.text = "texto2"
       label.font = UIFont.systemFont(ofSize: 12)
       label.textColor = UIColor.green
       label.numberOfLines = 1
       label.lineBreakMode = .byWordWrapping
       label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
       return label
   }()
    
    let date: UILabel = {
       let label = UILabel()
       label.text = "texto2"
       label.font = UIFont.systemFont(ofSize: 12)
       label.textColor = UIColor.green
       label.numberOfLines = 1
       label.lineBreakMode = .byWordWrapping
       label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
       return label
   }()
    
    let myDescri: UILabel = {
       let label = UILabel()
       label.text = "texto2"
       label.font = UIFont.systemFont(ofSize: 10)
       label.textColor = UIColor.white
       label.backgroundColor = .black
       label.numberOfLines = 10
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
        setupViewContraints()
        print(texto2)
    }
    
    func setupViewContraints() {
        
        view.addSubview(containerView)
        containerView.addSubview(closeBtn)
        containerView.addSubview(myImg)
        containerView.addSubview(myLbl)
        containerView.addSubview(rate)
        containerView.addSubview(date)
        containerView.addSubview(myDescri)
        
        
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
        
        rate.topAnchor.constraint(equalTo: myLbl.bottomAnchor, constant: 5).isActive = true
        rate.widthAnchor.constraint(equalToConstant: 100).isActive = true
        rate.heightAnchor.constraint(equalToConstant: 20).isActive = true
        rate.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -40).isActive = true
        //rate.centerXAnchor.constraint(equalTo: myImg.centerXAnchor, constant: 0).isActive = true
        rate.text = "⭐️ \(texto3)"
        
        date.topAnchor.constraint(equalTo: myLbl.bottomAnchor, constant: 5).isActive = true
        date.widthAnchor.constraint(equalToConstant: 100).isActive = true
        date.heightAnchor.constraint(equalToConstant: 20).isActive = true
        date.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 40).isActive = true
       // date.centerXAnchor.constraint(equalTo: myImg.centerXAnchor, constant: 0).isActive = true
        date.text = "📅 \(texto4)"
        
        
        myDescri.topAnchor.constraint(equalTo: rate.bottomAnchor, constant: 40).isActive = true
        myDescri.widthAnchor.constraint(equalToConstant: 250).isActive = true
        myDescri.heightAnchor.constraint(equalToConstant: 80).isActive = true
        myDescri.centerXAnchor.constraint(equalTo: myImg.centerXAnchor, constant: 0).isActive = true
        myDescri.text = texto2
        
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true

        containerView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 500).isActive = true
   
    }

}


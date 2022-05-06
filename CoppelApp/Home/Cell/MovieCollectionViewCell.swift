//
//  MovieCollectionViewCell.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 05/05/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
    public var titulo: String?
    
     let myImg: UIImageView = {
        let imageV = UIImageView()
         imageV.backgroundColor = UIColor.black
         imageV.layer.cornerRadius = 25
         imageV.contentMode = .scaleToFill
         imageV.translatesAutoresizingMaskIntoConstraints = false
     return imageV
    }()
    
     let myLbl: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.green
        label.backgroundColor = .black
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    let myLblDate: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.green
        label.backgroundColor = .black
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
       return label
   }()
    
    let myLblDes: UILabel = {
       let label = UILabel()
       label.text = "title"
       label.font = UIFont.systemFont(ofSize: 10)
       label.textColor = UIColor.white
       label.backgroundColor = .black
       label.numberOfLines = 4
        label.lineBreakMode = .byTruncatingMiddle
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
       return label
   }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            myLbl.text = titulo
            addViews()
        }

        func addViews(){
            contentView.backgroundColor = .black
            addSubview(myImg)
            addSubview(myLbl)
            addSubview(myLblDate)
            addSubview(myLblDes)
            
            
            myImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
            myImg.widthAnchor.constraint(equalToConstant:  160).isActive = true
            myImg.heightAnchor.constraint(equalToConstant: 220).isActive = true
            myImg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
            
            myLbl.topAnchor.constraint(equalTo: myImg.bottomAnchor, constant: 5).isActive = true
            myLbl.widthAnchor.constraint(equalToConstant:  100).isActive = true
            myLbl.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
            
            myLblDate.topAnchor.constraint(equalTo: myLbl.bottomAnchor, constant: 5).isActive = true
            myLblDate.widthAnchor.constraint(equalToConstant:  100).isActive = true
            myLblDate.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
            
            myLblDes.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50).isActive = true
            myLblDes.heightAnchor.constraint(equalToConstant: 40).isActive = true
            myLblDes.widthAnchor.constraint(equalToConstant: 130).isActive = true
            myLblDes.centerXAnchor.constraint(equalTo: myImg.centerXAnchor, constant: 0).isActive = true

         
        }

    
    required init?(coder aDecoder: NSCoder) {
               fatalError("init(coder:) has not been implemented")
    }
   
}

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

            //myLbl.topAnchor.constraint(equalTo:contentView.bottomAnchor, constant: -30).isActive = true
//            myLbl.widthAnchor.constraint(equalToConstant:  150).isActive = true
//           myLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
//            myLbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        }

    
    required init?(coder aDecoder: NSCoder) {
               fatalError("init(coder:) has not been implemented")
    }
   
    
    
//    func cellStack() -> UIStackView {
//        let stackView = UIStackView(arrangedSubviews: [nameLabel,showCaseImageView])
//        stackView.axis = .vertical
//        stackView.layer.cornerRadius = 25
//        stackView.backgroundColor = .brown
//        stackView.distribution = .fill
//        stackView.spacing = 2
//        return stackView
//    }
//
//        let nameLabel: UILabel = {
//            let label = UILabel()
//            label.font = UIFont.systemFont(ofSize: 14)
//            label.textColor = UIColor.green
//            label.text = "Titulo"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            return label
//        }()
//
//        let showCaseImageView: UIImageView = {
//            let imageView = UIImageView()
//            imageView.backgroundColor = UIColor.white
//            imageView.image = UIImage(named: "mrobot")
//            imageView.contentMode = .scaleAspectFill
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            return imageView
//        }()
//
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//
//            addViews()
//        }
//
//        func addViews(){
//            let cellStackV = cellStack()
//            cellStackV.translatesAutoresizingMaskIntoConstraints = false
//            backgroundColor = UIColor.systemBlue
//            addSubview(cellStackV)
//
//            showCaseImageView.topAnchor.constraint(equalTo: cellStackV.topAnchor, constant: 5).isActive = true
//            showCaseImageView.widthAnchor.constraint(equalToConstant:  160).isActive = true
//            showCaseImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
//
//            nameLabel.topAnchor.constraint(equalTo: cellStackV.bottomAnchor, constant: -10).isActive = true
//
//
//        }
//
//
//
//        required init?(coder aDecoder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        nameLabel.text = nil
//    }
//
//
}

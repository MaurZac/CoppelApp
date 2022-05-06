//
//  MovieCollectionViewCell.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 05/05/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
    
     let myImg: UIImageView = {
        let imageV = UIImageView()
         imageV.backgroundColor = UIColor.systemGray2
         imageV.layer.cornerRadius = 25
         imageV.contentMode = .scaleAspectFill
         imageV.translatesAutoresizingMaskIntoConstraints = false
     return imageV
    }()
    
     let myLbl: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.green
         label.backgroundColor = .blue
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            addViews()
        }

        func addViews(){
            contentView.backgroundColor = .red
            addSubview(myImg)
            addSubview(myLbl)
            
            
            myImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
            myImg.widthAnchor.constraint(equalToConstant:  163).isActive = true
            myImg.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -30).isActive = true
            myImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true

            
            myLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
            myLbl.widthAnchor.constraint(equalToConstant:  162).isActive = true
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

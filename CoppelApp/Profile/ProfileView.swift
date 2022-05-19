//
//  ProfileView.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 17/05/22.
//

import Foundation
import UIKit

protocol AnyProfileView {
    var presenter: AnyProfilePresenter? { get set }
    func moviesList(with movies: [Welcome])
    func movieError(with error: String)
}

class ProfileViewController: UIViewController, AnyProfileView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
   
    var presenter: AnyProfilePresenter?
    var moviesNow: [Welcome]?
    let newfunc = HomeViewController.formattedDateFromString(HomeViewController())
    
    let lblTitle: UILabel = {
        let lblTitle = UILabel()
        lblTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        lblTitle.textColor = .systemGreen
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.textAlignment = .left
        return lblTitle
    }()
    
    let profileImg: UIImageView = {
        let profileImg = UIImageView()
        profileImg.image = UIImage(systemName: "person.circle")
        profileImg.tintColor = .green
        //background.frame = CGRect(x: 150, y: 150, width: 100, height: 100)
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        profileImg.contentMode = .scaleAspectFit
        return profileImg
    }()
    
    let lblUser: UILabel = {
        let lblUser = UILabel()
        lblUser.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        lblUser.textColor = .systemGreen
        lblUser.translatesAutoresizingMaskIntoConstraints = false
        lblUser.textAlignment = .center
        return lblUser
    }()
    
    let lblFav: UILabel = {
        let lblFav = UILabel()
        lblFav.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        lblFav.textColor = .systemGreen
        lblFav.translatesAutoresizingMaskIntoConstraints = false
        lblFav.textAlignment = .center
        return lblFav
    }()
    
    let collectionview :UICollectionView = {
         let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        layout.estimatedItemSize = .zero
          let collectionview = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.clear
        collectionview.layer.cornerRadius = 15
        collectionview.layoutIfNeeded()
          return collectionview
      }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupViewContraints()
        DispatchQueue.main.async { [self] in
            collectionview.reloadData()
            collectionview.delegate = self
            collectionview.dataSource = self
        }
    }
    
    func getProfile() {
        print("profileonview")
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=34c5d1ffcfea821c6c7269f28caafa11&language=en-US&page=1") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let res = try? JSONDecoder().decode(Welcome.self, from: data) {
                    self.moviesNow = [res]
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
    func setupViewContraints(){
        view.addSubview(lblTitle)
        view.addSubview(profileImg)
        view.addSubview(lblUser)
        view.addSubview(lblFav)
        view.addSubview(collectionview)
        lblTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        lblTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lblTitle.text = "Profile"
        
        profileImg.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 30).isActive = true
        profileImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        profileImg.heightAnchor.constraint(equalToConstant: 90).isActive = true
        profileImg.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        lblUser.topAnchor.constraint(equalTo: profileImg.topAnchor, constant: 30).isActive = true
        lblUser.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor, constant: 15).isActive = true
        lblUser.text = "@maurzac"
        
        lblFav.topAnchor.constraint(equalTo: profileImg.bottomAnchor, constant: 60).isActive = true
        lblFav.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        lblFav.text = "Favorite Shows"
        
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.topAnchor.constraint(equalTo: lblFav.bottomAnchor, constant: 20).isActive = true
        collectionview.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        collectionview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesNow?[0].results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath as IndexPath) as! MovieCollectionViewCell
        cell.myLbl.text = moviesNow?[0].results[indexPath.row].originalTitle
        cell.myImg.downloaded(from: "https://image.tmdb.org/t/p/w500/\(String(describing: moviesNow?[0].results[indexPath.row].posterPath))")
        cell.myImg.clipsToBounds = true
        cell.myImg.layer.cornerRadius = 30
        cell.myLblDes.text = moviesNow?[0].results[indexPath.row].overview
        let stringB =  formattedDateFromString( dateString: moviesNow?[0].results[indexPath.row].releaseDate ?? "date", withFormat: "MMM dd, yyyy")
        cell.myLblDate.text = stringB
        
        return cell
    }
    
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        if let date = inputFormatter.date(from: dateString) {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = format
        return outputFormatter.string(from: date)
        }
        return nil
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
    func moviesList(with movies: [Welcome]) {
        DispatchQueue.main.async { [self] in
            moviesNow = movies
            collectionview.reloadData()
            print("datax: \(moviesNow?[0].results.count)")
        }
        
    }
    
    func movieError(with error: String) {
        print("errorx")
    }
    
}

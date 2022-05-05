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
    func update(with nCell: Int)
}

class HomeViewController: UIViewController, HomeAnyView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
   
    var presenter: HomeAnyPresenter?
    var cellNumber = 0
    
    let segmentMenu: UISegmentedControl = {
        let segmenu = UISegmentedControl(items: ["Popular", "Top Rated", "On Tv", "Airing Today"])
        segmenu.backgroundColor = .darkGray
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmenu.setTitleTextAttributes(titleTextAttributes, for: .normal)
        segmenu.setTitleTextAttributes(titleTextAttributes, for: .selected)
        segmenu.selectedSegmentIndex = 0
        segmenu.selectedSegmentTintColor = UIColor.systemGray4
        segmenu.translatesAutoresizingMaskIntoConstraints = false
        segmenu.addTarget(self, action: #selector(HomeViewController.indexChanged(_:)), for: .valueChanged)
        return segmenu
    }()
    

      let collectionview :UICollectionView = {
           let layout = UICollectionViewFlowLayout()
            let collectionview = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
          layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
          layout.itemSize = CGSize(width: 160, height: 180)
          layout.scrollDirection = .vertical
          collectionview.translatesAutoresizingMaskIntoConstraints = false
          collectionview.backgroundColor = .red
          collectionview.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
          collectionview.showsVerticalScrollIndicator = false
          collectionview.backgroundColor = UIColor.clear
          collectionview.layer.cornerRadius = 15
          collectionview.layoutIfNeeded()
            return collectionview
        }()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.interactor?.getMovies()
        navigationController?.navigationBar.tintColor = .white
        view.backgroundColor = .systemGray5
        title = "TV Shows"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        setupViewContraints()
        btnNavBar()
        collectionview.delegate = self
        collectionview.dataSource = self
    }
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        switch segmentMenu.selectedSegmentIndex {
        case 0:
            print("0")
        case 1:
            print("1")
        case 2:
            print("2")
        case 3:
            print("3")
        default:
            print("default")
        }
    }

    func setupViewContraints() {
        view.addSubview(segmentMenu)
        view.addSubview(collectionview)
        
        segmentMenu.translatesAutoresizingMaskIntoConstraints = false
        segmentMenu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        segmentMenu.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        segmentMenu.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.topAnchor.constraint(equalTo: segmentMenu.bottomAnchor, constant: 20).isActive = true
        collectionview.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        collectionview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath as IndexPath) as! MovieCollectionViewCell
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    
    func update(with nCell: Int) {
        print(nCell)
        cellNumber = nCell
        print(cellNumber)
    }
    
   

    
 
}

extension HomeViewController{
    func btnNavBar(){
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

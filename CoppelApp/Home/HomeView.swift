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
    func update(with resul: [Welcome])
    func update(with error: String)
}


class HomeViewController: UIViewController, HomeAnyView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    var presenter: HomeAnyPresenter?
    var window: UIWindow?
    
    
    var infoRes: [Welcome] = []
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
        navigationController?.navigationBar.tintColor = .white
        view.backgroundColor = .systemGray5
        title = "TV Shows"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        setupViewContraints()
        btnNavBar()
        collectionview.delegate = self
        collectionview.dataSource = self
        getMovies()
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

    func getMovies() {
        print("entraGetMovies")
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=34c5d1ffcfea821c6c7269f28caafa11&language=en-US&page=1") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let res = try? JSONDecoder().decode(Welcome.self, from: data) {
                    self.infoRes = [res]
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
    
    func update(with resul: [Welcome]) {
        DispatchQueue.main.async {
            self.infoRes = resul
            //print("adentro\(self.infoRes?.results.count)")
        }
        //print("afuera\(infoRes?.results.count)")
    }
    
    func update(with error: String) {
        print("omgError")
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infoRes[0].results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath as IndexPath) as! MovieCollectionViewCell
        cell.myLbl.text = infoRes[0].results[indexPath.row].originalTitle
        cell.myImg.downloaded(from: "https://image.tmdb.org/t/p/w500/\(infoRes[0].results[indexPath.row].posterPath)")
        cell.myImg.clipsToBounds = true
        cell.myImg.layer.cornerRadius = 30
        cell.myLblDes.text = infoRes[0].results[indexPath.row].overview
        let stringB = formattedDateFromString( dateString: infoRes[0].results[indexPath.row].releaseDate, withFormat: "MMM dd, yyyy")
        cell.myLblDate.text = stringB
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        DispatchQueue.main.async { [self] in
            let destinationVC = ModalViewController()
            destinationVC.texto1 = infoRes[0].results[indexPath.row].originalTitle
            destinationVC.texto2 = infoRes[0].results[indexPath.row].overview
            destinationVC.texto3 = infoRes[0].results[indexPath.row].voteAverage
            destinationVC.imgPath1 = "https://image.tmdb.org/t/p/w500/\(infoRes[0].results[indexPath.row].posterPath)"
            let stringB = formattedDateFromString( dateString: infoRes[0].results[indexPath.row].releaseDate, withFormat: "MMM dd, yyyy")
            destinationVC.texto4 = stringB ?? ""
            present(destinationVC, animated: true, completion: nil)
            
                let userRouter = ModalRouter.start()
                let initialVC = userRouter.entry
                initialVC?.presenter?.view?.update(with: infoRes[0].results[indexPath.row].originalTitle)
                let window = UIWindow()
                window.rootViewController = initialVC
                self.window = window
                window.makeKeyAndVisible()
            
        }
    }
    
    func newView(onViewC: UIViewController) {
        DispatchQueue.main.async {
            let navController = UINavigationController(rootViewController: onViewC)
            navController.modalPresentationStyle = .popover
            navController.navigationBar.backgroundColor = .clear
            self.present(navController, animated: true, completion: nil)
        }

    }
}

extension HomeViewController{
    
    func btnNavBar(){
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(systemName: "list.dash"), for: .normal)
        //button.addTarget(self, action:#selector(menuItem), for: .touchDown)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.menu = menuItem()
        button.showsMenuAsPrimaryAction = true
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItems = [barButton]
    }
    
    func menuItem() -> UIMenu {
        let addMenuItems = UIMenu(title: "What do you want to do?", options:  .displayInline, children:  [
            UIAction(title: "View Profile" , image: UIImage(systemName: "")) {_ in
                print("Copy")
            },
            UIAction(title: "Log out", image: UIImage(systemName: "")) {_ in
                print("Copy")
            }
        ])
        return addMenuItems
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
        collectionview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        

    }
   
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

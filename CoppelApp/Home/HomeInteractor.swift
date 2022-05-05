//
//  Interactor.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 03/05/22.
//

import Foundation


protocol HomeAnyInteractor {
    var presenter: HomeAnyPresenter? {get set}
    func getMovies()
}

class HomeInteractor: HomeAnyInteractor {
    
    var presenter: HomeAnyPresenter?
    var resCeldas: Int?
    func getMovies() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=34c5d1ffcfea821c6c7269f28caafa11&language=en-US&page=1") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let res = try? JSONDecoder().decode(Welcome.self, from: data) {
                    print("interactor \(res.results.count)")
                    self.presenter?.view?.update(with: res.results.count)
//                    DispatchQueue.main.async {
//                        self.presenter?.view?.getNumCells(with: res.results.count)
//                        print(res.results.count)
//                    }
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
    
}

//
//  ProfileInteractor.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 17/05/22.
//

import Foundation

protocol AnyProfileInteractor {
    var presenter: AnyProfilePresenter? { get set }
    func getProfile()
}

class ProfileInteractor: AnyProfileInteractor {
    
    var presenter: AnyProfilePresenter?
    
    func getProfile() {
        print("profileMovies")
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=34c5d1ffcfea821c6c7269f28caafa11&language=en-US&page=1") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let res = try? JSONDecoder().decode(Welcome.self, from: data) {
                    self.presenter?.interactorUpdateProfile(with: .success([res]))
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

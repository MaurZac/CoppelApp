//
//  Interactor.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 02/05/22.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    func getToken()
    func loginUser(username: String, password: String)
}
class LogInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    public var errorlbl: String = ""
    
    func getToken() {
        guard let url = URL(string: "https://api.themoviedb.org/3/authentication/token/new?api_key=34c5d1ffcfea821c6c7269f28caafa11") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let token = try? JSONDecoder().decode([LogEntity].self, from: data) {
                    print(token)
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
    
    func loginUser(username: String, password: String) {
        let Url = String(format: "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=34c5d1ffcfea821c6c7269f28caafa11")
            guard let serviceUrl = URL(string: Url) else { return }
            let parameters: [String: Any] = [
                        "username" : username,
                        "password": password,
                        "request_token": "4fd49f5a19a183009aefe3be10bf446788642eb7"
            ]
            var request = URLRequest(url: serviceUrl)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                return
            }
            request.httpBody = httpBody
            request.timeoutInterval = 20
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let response = response {
                }
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                    } catch {
                        self.errorlbl = "\(error)"
                        print(error)
                    }
                }
            }.resume()
        }
    
    
    
}

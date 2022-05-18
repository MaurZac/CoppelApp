//
//  Interactor.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 02/05/22.
//

import Foundation
import UIKit

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    func getToken()
    func loginUser(username: String, password: String)
}
class LogInteractor: AnyInteractor {
    
    var presenter: AnyPresenter?
    public var errorlbl: String = ""
    var tokenOb: String = ""
    var customNavigation:UINavigationController?
    var window: UIWindow?
    
    func getToken() {
        guard let url = URL(string: "https://api.themoviedb.org/3/authentication/token/new?api_key=34c5d1ffcfea821c6c7269f28caafa11") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {

                if let token = try? JSONDecoder().decode(LogEntity.self, from: data) {
                    self.tokenOb = token.request_token
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
        let url = URL(string: "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=34c5d1ffcfea821c6c7269f28caafa11")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "username": username,
            "password": password,
            "request_token": tokenOb
        ]
        request.httpBody = parameters.percentEncoded()
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                error == nil else {                                              // check for fundamental
                print("error", error ?? "Unknown error")
                return
            }

            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                self.presenter?.view?.update(with: "\(response.statusCode) incorrect Data")
                return
            }

            DispatchQueue.main.async {
                    let userRouter = HomeRouter.start()
                    let initialVC = userRouter.entry
                    let window = UIWindow()
                    window.rootViewController = initialVC
                    self.window = window
                    window.makeKeyAndVisible()
            
                self.presenter?.view?.newView(onViewC: HomeViewController())
            }
        }

        task.resume()
        }
}


extension Dictionary {
    func percentEncoded() -> Data? {
        return map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}



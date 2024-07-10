//
//  NetworkService.swift
//  VkNews
//
//  Created by Nurgali on 05.07.2024.
//

import Foundation

protocol Networking {
    func request(path: String, params: [String: String], completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: Networking {
    
    private let authService: AuthService
    
    init(authService: AuthService = SceneDelegate.shared().authService) {
        self.authService = authService
    }
    
    func request(path: String, params: [String : String], completion: @escaping (Data?, (any Error)?) -> Void) {
        guard let token = authService.token else {return}
        var allParams = params
        allParams["access_token"] = token
        allParams["v"] = API.version
        let url = url(from: path, params: allParams)
        
        let session = URLSession.init(configuration: .default)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        task.resume()
        print(url)
    }
    
    
    func getFeed() {
        // secure key YhtGD77aQftv5831n49S
        // fe59dcebfe59dcebfe59dceba3fd40dcfaffe59fe59dceb9822d050a85542349c4d565f
        // POST https://api.vk.com/method/users.get?user_ids=743784474&fields=bdate&access_token=533bacf01e11f55b536a565b57531ac114461ae8736d6506a3&v=5.199 HTTP/1.1
        
        guard let token = authService.token else {return}
        let params = ["filters": "post,photo"]
        var allParams = params
        allParams["access_token"] = token
        allParams["v"] = API.version
        
        let url = url(from: API.newsFeed, params: allParams)
        print(url)
    }
    
    private func url(from path: String, params: [String: String]) -> URL {
        var components = URLComponents()
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = path
        components.queryItems = params.map { URLQueryItem.init(name: $0, value: $1)}
        
        return components.url!
    }
}

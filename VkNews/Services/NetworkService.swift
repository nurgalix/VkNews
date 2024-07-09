//
//  NetworkService.swift
//  VkNews
//
//  Created by Nurgali on 05.07.2024.
//

import Foundation

final class NetworkService {
    
    func getFeed() {
        
        // secure key YhtGD77aQftv5831n49S
        // fe59dcebfe59dcebfe59dceba3fd40dcfaffe59fe59dceb9822d050a85542349c4d565f
        // POST https://api.vk.com/method/users.get?user_ids=743784474&fields=bdate&access_token=533bacf01e11f55b536a565b57531ac114461ae8736d6506a3&v=5.199 HTTP/1.1
        
        
        let params = ["filters": "post,photo"]
        let allParams = params
        allParams["access_token"]
        
        
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.newsFeed
        components.queryItems
        
        components.url
    }
}

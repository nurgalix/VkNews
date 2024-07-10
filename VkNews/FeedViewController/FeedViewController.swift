//
//  FeedViewController.swift
//  VkNews
//
//  Created by Nurgali on 04.07.2024.
//

import Foundation
import UIKit

class FeedViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        networkService.getFeed()
    }
}

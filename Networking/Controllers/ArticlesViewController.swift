//
//  ArticlesViewController.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        
        // Test getArticles request
        APIClient.getArticles{ result in
            switch result {
            case .success(let articles):
                print("_____________________________")
                print(articles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // Test Login request
        APIClient.login(email: "test@gmail.com", password: "myPassword") { result in
            switch result {
            case .success(let user):
                print("_____________________________")
                print(user)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

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

        APIClient.login(email: "test@gmail.com", password: "myPassword")
                 .map({$0.id})
                 .andThen(APIClient.userArticles)
                 .map({$0.last!.id})
                 .andThen(APIClient.getArticle)
                 .execute(onSuccess: { article in
                    print(article)
                 }, onFailure: {error in
                    print(error)
                 })
    }
}

//
//  APIClient.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 14/12/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//


import Alamofire
import PromisedFuture

class APIClient {
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder()) -> Future<T, AFError> {
        return Future(operation: { completion in
            AF.request(route).responseDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T, AFError>) in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
        })
    }

    static func login(email: String, password: String) -> Future<User, AFError> {
        return performRequest(route: APIRouter.login(email: email, password: password))
    }

    static func userArticles(userID: Int) -> Future<[Article], AFError> {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(.articleDateFormatter)
        return performRequest(route: APIRouter.articles(userId: userID), decoder: jsonDecoder)
    }

    static func getArticle(articleID: Int) -> Future<Article, AFError> {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(.articleDateFormatter)
        return performRequest(route: APIRouter.article(id: articleID), decoder: jsonDecoder)
    }
}

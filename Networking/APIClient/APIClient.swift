//
//  APIClient.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 14/12/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Alamofire

class APIClient {
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        return AF.request(route)
                        .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                            completion(response.result)
        }
    }
    
    static func login(email: String, password: String, completion:@escaping (Result<User, AFError>)->Void) {
        performRequest(route: APIRouter.login(email: email, password: password), completion: completion)
    }
    
    static func getArticles(completion:@escaping (Result<[Article], AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(.articleDateFormatter)
        performRequest(route: APIRouter.articles, decoder: jsonDecoder, completion: completion)
    }
}


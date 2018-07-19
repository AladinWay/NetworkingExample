//
//  User.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let image: URL
}

//
//  User.swift
//  FriendFace
//
//  Created by Chiraphat Techasiri on 6/16/25.
//

import Foundation
import SwiftData

@Model
class User {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
    
    init(id: String, isActive: Bool, name: String, age: Int, company: String, email: String, address: String, about: String, registered: String, tags: [String], friends: [Friend]) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }
}

/// converts the DTO to SwiftData-compatible model
extension User {
    static func from(decoded: DecodedUser) -> User {
        let swiftDataFriends = decoded.friends.map {
            Friend(id: $0.id, name: $0.name)
        }
        return User(id: decoded.id, isActive: decoded.isActive, name: decoded.name, age: decoded.age, company: decoded.company, email: decoded.email, address: decoded.address, about: decoded.about, registered: decoded.registered, tags: decoded.tags, friends: swiftDataFriends)
    }
}

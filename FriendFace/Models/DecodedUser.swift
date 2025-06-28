//
//  DecodedUser.swift
//  FriendFace
//
//  Created by Chiraphat Techasiri on 6/28/25.
//

import Foundation

/// DTO to decode the JSON data to for User
struct DecodedUser: Codable, Identifiable {
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
    var friends: [DecodedFriend]
}





//
//  DecodedFriend.swift
//  FriendFace
//
//  Created by Chiraphat Techasiri on 6/28/25.
//

import Foundation

/// DTO to decode the JSON data to for Friend
struct DecodedFriend: Codable, Identifiable {
    var id: String
    var name: String
}

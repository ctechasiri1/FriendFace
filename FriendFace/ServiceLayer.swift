//
//  ServiceLayer.swift
//  FriendFace
//
//  Created by Chiraphat Techasiri on 6/16/25.
//

import Foundation

class ServiceLayer {
    /// this fetches the data from the JSON file and needs MainActor because data interacts with UI components
    @MainActor
    func fetchData() async throws -> [User] {
        /// Step 1: Checks if the URL is valid
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("The URL is invalid")
            return []
        }
        
        /// Step 2:  Performs the network call and retrieves the data
        let (data, _) = try await URLSession.shared.data(from: url)
        
        /// Step 3: Decodes the data into the DTO (Data Transfer Object)
        let decodedUsers = try JSONDecoder().decode([DecodedUser].self, from: data)
        
        /// Step 4: Uses the User extension to map the DecodedUser and User together
        let users = decodedUsers.map(User.from)
        
        return users
    }
}

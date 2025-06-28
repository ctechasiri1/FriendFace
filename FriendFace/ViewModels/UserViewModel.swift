//
//  UserViewModel.swift
//  FriendFace
//
//  Created by Chiraphat Techasiri on 6/17/25.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    let service = ServiceLayer()
    
    @MainActor
    func loadData() async {
        do {
            users = try await service.fetchData()
        } catch {
            print("There was an error fetching data: \(error)")
        }
    }
}

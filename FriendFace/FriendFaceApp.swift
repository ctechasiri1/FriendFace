//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Chiraphat Techasiri on 6/16/25.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [User.self, Friend.self])
        }
    }
}

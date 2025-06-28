//
//  ContentView.swift
//  FriendFace
//
//  Created by Chiraphat Techasiri on 6/16/25.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.users) { user in
                    NavigationLink {
                        DetailView(user: user)
                    } label: {
                        HStack(spacing: 15.0) {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 8, height: 8)
                                .foregroundStyle(user.isActive ? Color.green : Color.red)
                            
                            Text(user.name)
                        }
                        .padding(.vertical, 10.0)
                    }
                }
            }
            .navigationTitle("Friend Face")
            .task {
                await viewModel.loadData()
            }
        }
    }
}

#Preview {
    ContentView()
}

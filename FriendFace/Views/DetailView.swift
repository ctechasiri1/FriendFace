//
//  DetailView.swift
//  FriendFace
//
//  Created by Chiraphat Techasiri on 6/17/25.
//

import SwiftUI

// combine struct and extension to reduce modifier code
struct CombineViewModifier: ViewModifier {
    private let cornerRadius: CGFloat = 12.0
    private let fontSize: CGFloat = 20.0
    private let bottomPadding: CGFloat = 15.0
    private let horizontalPadding: CGFloat = 25.0

    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .font(.system(size: fontSize))
            .padding(.horizontal, horizontalPadding)
            .padding(.bottom, bottomPadding)
    }
}

extension View {
    func combineViewModifier() -> some View {
        self.modifier(CombineViewModifier())
    }
}

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    let user: User
    
    var body: some View {
        ScrollView {
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 90.0, height: 90.0)
                    .padding()
                    .foregroundStyle(user.isActive ? Color.green : Color.red)
                
                VStack(alignment: .leading) {
                    Text("\(user.name)")
                        .fixedSize(horizontal: true, vertical: false)
                        .font(.system(size: 25.0))
                        .fontWeight(.bold)
                    
                    Text("\(user.company)")
                }
            }
            .padding(.trailing, 60)
            
            VStack(alignment: .leading, spacing: 12.0) {
                Text("Age: \(user.age)")
                
                Text("\(user.email)")
                    .foregroundStyle(Color.blue)
                
                Divider()
                
                Text("\(user.address)")
                    .multilineTextAlignment(.leading)
            }
            .combineViewModifier()

            
            VStack(alignment: .leading, spacing: 12.0) {
                Text("About")
                    .fontWeight(.bold)
                
                Text("\(user.about)")
            }
            .combineViewModifier()

            
            VStack(alignment: .leading) {
                Text("Friends")
                    .fontWeight(.bold)
                
                ForEach(user.friends) { friend in
                    Divider()
                    
                    Text("\(friend.name)")
                }
            }
            .combineViewModifier()
        }
        .background(Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1))
        .navigationTitle("\(user.name)")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.backward")
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    let new_user = User(id: "", isActive: false, name: "", age: 12, company: "", email: "", address: "", about: "", registered: "", tags: [""], friends: [Friend(id: "", name: "")])
    DetailView(user: new_user)
}

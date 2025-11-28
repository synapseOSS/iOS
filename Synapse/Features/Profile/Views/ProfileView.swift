import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 16) {
            Circle().fill(.gray.opacity(0.3)).frame(width: 100, height: 100)
            Text(user.displayName ?? user.username).font(.title2.bold())
            if let bio = user.bio { Text(bio).foregroundColor(.secondary) }
        }
        .navigationTitle("Profile")
    }
}

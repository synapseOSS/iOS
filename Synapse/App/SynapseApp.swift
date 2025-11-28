import SwiftUI

@main
struct SynapseApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authViewModel.isAuthenticated { HomeView() }
                else { LoginView() }
            }
            .environmentObject(authViewModel)
            .task { await authViewModel.checkSession() }
        }
    }
}

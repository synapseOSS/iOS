import Foundation

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let authService = AuthService()
    
    func signUp(email: String, password: String) async {
        isLoading = true; errorMessage = nil
        do {
            currentUser = try await authService.signUp(email: email, password: password)
            isAuthenticated = true
        } catch { errorMessage = error.localizedDescription }
        isLoading = false
    }
    
    func signIn(email: String, password: String) async {
        isLoading = true; errorMessage = nil
        do {
            currentUser = try await authService.signIn(email: email, password: password)
            isAuthenticated = true
        } catch { errorMessage = error.localizedDescription }
        isLoading = false
    }
    
    func signOut() async {
        try? await authService.signOut()
        currentUser = nil; isAuthenticated = false
    }
    
    func resetPassword(email: String) async {
        isLoading = true
        try? await authService.resetPassword(email: email)
        isLoading = false
    }
    
    func checkSession() async {
        if let session = await authService.getCurrentSession() {
            currentUser = User(from: session.user)
            isAuthenticated = true
        }
    }
}

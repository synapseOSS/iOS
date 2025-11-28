import Foundation
import Supabase

final class AuthService {
    private let supabase = SupabaseManager.shared
    
    func signUp(email: String, password: String) async throws -> User {
        let response = try await supabase.auth.signUp(email: email, password: password)
        guard let user = response.user else { throw AuthError.signUpFailed }
        return User(from: user)
    }
    
    func signIn(email: String, password: String) async throws -> User {
        let session = try await supabase.auth.signIn(email: email, password: password)
        return User(from: session.user)
    }
    
    func signOut() async throws {
        try await supabase.auth.signOut()
    }
    
    func resetPassword(email: String) async throws {
        try await supabase.auth.resetPasswordForEmail(email)
    }
    
    func getCurrentSession() async -> Session? {
        try? await supabase.auth.session
    }
}

enum AuthError: LocalizedError {
    case signUpFailed
    var errorDescription: String? { "Failed to create account" }
}

import Foundation
import Supabase

final class SupabaseManager {
    static let shared = SupabaseManager()
    
    let client: SupabaseClient
    
    private init() {
        client = SupabaseClient(
            supabaseURL: URL(string: AppConstants.supabaseURL)!,
            supabaseKey: AppConstants.supabaseAnonKey
        )
    }
    
    var auth: AuthClient { client.auth }
    var database: PostgrestClient { client.database }
}

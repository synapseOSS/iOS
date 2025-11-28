import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let supabase = SupabaseManager.shared
    
    func fetchPosts() async {
        isLoading = true; errorMessage = nil
        do {
            posts = try await supabase.database
                .from("posts")
                .select("*, user:users(*)")
                .order("created_at", ascending: false)
                .execute()
                .value
        } catch { errorMessage = error.localizedDescription }
        isLoading = false
    }
}

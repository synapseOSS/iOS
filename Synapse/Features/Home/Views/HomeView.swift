import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading && viewModel.posts.isEmpty {
                    ProgressView()
                } else if let error = viewModel.errorMessage, viewModel.posts.isEmpty {
                    VStack(spacing: 16) {
                        Text(error).foregroundColor(.secondary)
                        Button("Retry") { Task { await viewModel.fetchPosts() } }
                    }
                } else if viewModel.posts.isEmpty {
                    Text("No posts yet").foregroundColor(.secondary)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.posts) { PostCardView(post: $0) }
                        }.padding()
                    }
                    .refreshable { await viewModel.fetchPosts() }
                }
            }
            .navigationTitle("Synapse")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Sign Out") { Task { await authViewModel.signOut() } }
                }
            }
        }
        .task { await viewModel.fetchPosts() }
    }
}

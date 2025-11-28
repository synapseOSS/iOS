import SwiftUI
import NukeUI

struct PostCardView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Circle().fill(.gray.opacity(0.3)).frame(width: 40, height: 40)
                VStack(alignment: .leading) {
                    Text(post.user?.displayName ?? post.user?.username ?? "User").font(.subheadline.bold())
                    Text(post.createdAt.timeAgo).font(.caption).foregroundColor(.secondary)
                }
                Spacer()
            }
            
            Text(post.content)
            
            if let imageUrls = post.imageUrls, let first = imageUrls.first, let url = URL(string: first) {
                LazyImage(url: url) { state in
                    if let image = state.image { image.resizable().aspectRatio(contentMode: .fill) }
                    else { Rectangle().fill(.gray.opacity(0.2)) }
                }
                .frame(maxHeight: 300)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            HStack(spacing: 24) {
                Label("\(post.likesCount)", systemImage: "heart")
                Label("\(post.commentsCount)", systemImage: "bubble.right")
                Label("Share", systemImage: "square.and.arrow.up")
            }
            .font(.subheadline).foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 5, y: 2)
    }
}

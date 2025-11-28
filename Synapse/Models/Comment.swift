import Foundation

struct Comment: Codable, Identifiable {
    let id: UUID
    let postId: UUID
    let userId: UUID
    let content: String
    let createdAt: Date
    var user: User?
}

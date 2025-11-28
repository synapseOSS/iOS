import Foundation

struct Post: Codable, Identifiable {
    let id: UUID
    let userId: UUID
    let content: String
    let imageUrls: [String]?
    var likesCount: Int
    var commentsCount: Int
    let createdAt: Date
    var updatedAt: Date
    var user: User?
}

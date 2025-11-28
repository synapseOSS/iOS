import Foundation

struct Story: Codable, Identifiable {
    let id: UUID
    let userId: UUID
    let mediaUrl: String
    let mediaType: MediaType
    let expiresAt: Date
    let createdAt: Date
    var user: User?
}

enum MediaType: String, Codable {
    case image, video
}

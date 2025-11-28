import Foundation
import Supabase

struct User: Codable, Identifiable {
    let id: UUID
    let email: String
    var username: String
    var displayName: String?
    var avatarUrl: String?
    var bio: String?
    let createdAt: Date
    var updatedAt: Date
    
    init(from authUser: Supabase.User) {
        self.id = authUser.id
        self.email = authUser.email ?? ""
        self.username = authUser.userMetadata["username"]?.stringValue ?? ""
        self.displayName = authUser.userMetadata["display_name"]?.stringValue
        self.avatarUrl = authUser.userMetadata["avatar_url"]?.stringValue
        self.bio = nil
        self.createdAt = authUser.createdAt
        self.updatedAt = authUser.updatedAt ?? authUser.createdAt
    }
}

extension AnyJSON {
    var stringValue: String? {
        if case .string(let value) = self { return value }
        return nil
    }
}

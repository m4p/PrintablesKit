import Foundation

/// Representation of a Print
public struct Print: Identifiable, Hashable {
    public let id: String
    public let name: String
    public let images: [URL]
    public let nsfw: Bool
    public let hasModel: Bool
    public var liked: Bool = false
    public let likesCount: Int
    public let downloadCount: Int
    public let datePublished: Date
    
    // MARK: - Properties available on PrintType, but not on PrintSearchType
    
    public let summary: String?
    public let description: String?
    public let user: User?
    public let makesCount: Int?
    public let tags: [Tag]?
    public let stls: [PrintFile]?
    public let gcodes: [PrintFile]?
    public let slas: [PrintFile]?
    public let pdfFilePath: String?
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Print, rhs: Print) -> Bool {
        lhs.id == rhs.id && lhs.images == rhs.images
    }
}

public struct Tag : Identifiable, Equatable {
    public let id: String
    public let name: String
}

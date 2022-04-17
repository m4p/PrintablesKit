import Foundation

public struct User: Identifiable {
    public let id: String
    public let name: String
    public let avatarFilePath: String
    public let handle: String
    public let company: Bool
    public let verified: Bool
    
    public var avatarFileURL: URL {
        Constants.mediaBaseURL.appendingPathComponent(avatarFilePath)
    }
}

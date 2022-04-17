import Foundation
import SceneKit.ModelIO

public struct PrintFile: Identifiable, Equatable {
    public enum PrintFileType {
        case stl
        case sla
        case gcode
    }
    
    public let id: String
    public let name: String
    public let filePath: String
    public let filePreviewPath: String
    public let fileSize: Int
    public let type: PrintFileType
    
    public var fileURL: URL { Constants.filesBaseURL.appendingPathComponent(filePath) }
    public var filePreviewURL: URL { Constants.filesBaseURL.appendingPathComponent(filePreviewPath) }
    
    // Untested
    @available(iOS 16, *)
    public func sceneNode() async throws -> SCNNode? {
        guard type == .stl else { return nil }
        guard let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        let cacheFile = cacheURL.appendingPathComponent("\(id).stl")
        if !FileManager.default.fileExists(atPath: filePath) {
            let (downloadURL, _) = try await URLSession.shared.download(from: fileURL)
            try FileManager.default.moveItem(at: downloadURL, to: cacheFile)
        }
        let asset = MDLAsset(url: cacheFile)

        guard let object = asset.object(at: 0) as? MDLMesh else { return nil }
        return await SCNNode(mdlObject: object)
    }
}

import Foundation

public extension Print {
    static func preview(_ number: Int) -> Print {
        .init(id: UUID().uuidString,
              name: PreviewData.names[number],
              images: [URL(string: "https://picsum.photos/300/200")!],
              nsfw: false,
              hasModel: true,
              likesCount: 42,
              downloadCount: 23,
              datePublished: Date(),
              summary: "This is a summary",
              description: "This is a description. It contains <strong>HTML</strong>",
              user: User(id: UUID().uuidString,
                         name: "Arthur Dent",
                         avatarFilePath: "https://picsum.photos/300/300",
                         handle: "adent42",
                         company: false,
                         verified: true),
              makesCount: 12,
              tags: [Tag(id: UUID().uuidString, name: "PreviewData")],
              stls: [PrintFile(id: UUID().uuidString, name: "PreviewFile", filePath: "/media/prints/500651/stls/4070363_c4f279df-2866-4f89-ab5c-ad6824b56d07/lilith-head.stl", filePreviewPath: "previewstl", fileSize: 4242, type: .stl)],
              gcodes: [],
              slas: [],
              pdfFilePath: "preview.pdf"
        )
    }
}

public struct PreviewData {
    static var names: [String] = ["Cat", "Dog", "Mouse", "Bike", "House", "Mac", "Unicorn", "Ball", "Cube", "Rain", "Wonder", "Bow", "Dirt", "Example"]
}

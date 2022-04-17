// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphQL {
  class PrintProfileQuery: GraphQLQuery {
    static let operationName: String = "PrintProfile"
    static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query PrintProfile($id: ID!) {
          print(id: $id) {
            __typename
            id
            name
            user {
              __typename
              id
              publicUsername
              avatarFilePath
              handle
              company
              verified
            }
            images {
              __typename
              id
              filePath
              rotation
            }
            nsfw
            hasModel
            liked
            likesCount
            downloadCount
            datePublished
            summary
            description
            makesCount
            tags {
              __typename
              id
              name
            }
            pdfFilePath
            gcodes {
              __typename
              id
              name
              filePath
              fileSize
              filePreviewPath
            }
            stls {
              __typename
              id
              name
              filePath
              fileSize
              filePreviewPath
            }
            slas {
              __typename
              id
              name
              filePath
              fileSize
              filePreviewPath
            }
          }
        }
        """#
      ))

    public var id: ID

    public init(id: ID) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    struct Data: GraphQL.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("print", Print?.self, arguments: ["id": .variable("id")]),
      ] }

      var print: Print? { __data["print"] }

      /// Print
      ///
      /// Parent Type: `PrintType`
      struct Print: GraphQL.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.PrintType }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", GraphQL.ID.self),
          .field("name", String.self),
          .field("user", User?.self),
          .field("images", [Image]?.self),
          .field("nsfw", Bool.self),
          .field("hasModel", Bool.self),
          .field("liked", Bool?.self),
          .field("likesCount", Int.self),
          .field("downloadCount", Int.self),
          .field("datePublished", String.self),
          .field("summary", String?.self),
          .field("description", String?.self),
          .field("makesCount", Int.self),
          .field("tags", [Tag]?.self),
          .field("pdfFilePath", String?.self),
          .field("gcodes", [Gcode]?.self),
          .field("stls", [Stl]?.self),
          .field("slas", [Sla]?.self),
        ] }

        var id: GraphQL.ID { __data["id"] }
        var name: String { __data["name"] }
        var user: User? { __data["user"] }
        var images: [Image]? { __data["images"] }
        var nsfw: Bool { __data["nsfw"] }
        var hasModel: Bool { __data["hasModel"] }
        var liked: Bool? { __data["liked"] }
        var likesCount: Int { __data["likesCount"] }
        var downloadCount: Int { __data["downloadCount"] }
        var datePublished: String { __data["datePublished"] }
        var summary: String? { __data["summary"] }
        /// Description as HTML
        var description: String? { __data["description"] }
        var makesCount: Int { __data["makesCount"] }
        var tags: [Tag]? { __data["tags"] }
        var pdfFilePath: String? { __data["pdfFilePath"] }
        var gcodes: [Gcode]? { __data["gcodes"] }
        var stls: [Stl]? { __data["stls"] }
        var slas: [Sla]? { __data["slas"] }

        /// Print.User
        ///
        /// Parent Type: `UserType`
        struct User: GraphQL.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.UserType }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", GraphQL.ID.self),
            .field("publicUsername", String.self),
            .field("avatarFilePath", String.self),
            .field("handle", String.self),
            .field("company", Bool.self),
            .field("verified", Bool.self),
          ] }

          var id: GraphQL.ID { __data["id"] }
          var publicUsername: String { __data["publicUsername"] }
          var avatarFilePath: String { __data["avatarFilePath"] }
          var handle: String { __data["handle"] }
          var company: Bool { __data["company"] }
          var verified: Bool { __data["verified"] }
        }

        /// Print.Image
        ///
        /// Parent Type: `PrintImageType`
        struct Image: GraphQL.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.PrintImageType }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", GraphQL.ID.self),
            .field("filePath", String.self),
            .field("rotation", Int.self),
          ] }

          var id: GraphQL.ID { __data["id"] }
          var filePath: String { __data["filePath"] }
          var rotation: Int { __data["rotation"] }
        }

        /// Print.Tag
        ///
        /// Parent Type: `TagType`
        struct Tag: GraphQL.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.TagType }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", GraphQL.ID.self),
            .field("name", String.self),
          ] }

          var id: GraphQL.ID { __data["id"] }
          var name: String { __data["name"] }
        }

        /// Print.Gcode
        ///
        /// Parent Type: `GCodeType`
        struct Gcode: GraphQL.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.GCodeType }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", GraphQL.ID.self),
            .field("name", String.self),
            .field("filePath", String.self),
            .field("fileSize", Int.self),
            .field("filePreviewPath", String.self),
          ] }

          var id: GraphQL.ID { __data["id"] }
          var name: String { __data["name"] }
          var filePath: String { __data["filePath"] }
          var fileSize: Int { __data["fileSize"] }
          var filePreviewPath: String { __data["filePreviewPath"] }
        }

        /// Print.Stl
        ///
        /// Parent Type: `STLType`
        struct Stl: GraphQL.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.STLType }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", GraphQL.ID.self),
            .field("name", String.self),
            .field("filePath", String.self),
            .field("fileSize", Int.self),
            .field("filePreviewPath", String.self),
          ] }

          var id: GraphQL.ID { __data["id"] }
          var name: String { __data["name"] }
          var filePath: String { __data["filePath"] }
          var fileSize: Int { __data["fileSize"] }
          var filePreviewPath: String { __data["filePreviewPath"] }
        }

        /// Print.Sla
        ///
        /// Parent Type: `SLAType`
        struct Sla: GraphQL.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.SLAType }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", GraphQL.ID.self),
            .field("name", String.self),
            .field("filePath", String.self),
            .field("fileSize", Int.self),
            .field("filePreviewPath", String.self),
          ] }

          var id: GraphQL.ID { __data["id"] }
          var name: String { __data["name"] }
          var filePath: String { __data["filePath"] }
          var fileSize: Int { __data["fileSize"] }
          var filePreviewPath: String { __data["filePreviewPath"] }
        }
      }
    }
  }

}
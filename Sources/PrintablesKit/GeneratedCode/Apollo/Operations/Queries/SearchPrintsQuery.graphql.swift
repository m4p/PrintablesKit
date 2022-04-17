// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphQL {
  class SearchPrintsQuery: GraphQLQuery {
    static let operationName: String = "SearchPrints"
    static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query SearchPrints($query: String!, $limit: Int, $offset: Int, $ordering: SearchChoicesEnum) {
          searchPrints(query: $query, limit: $limit, offset: $offset, ordering: $ordering) {
            __typename
            items {
              __typename
              id
              name
              image {
                __typename
                filePath
                rotation
              }
              nsfw
              hasModel
              liked
              likesCount
              downloadCount
              datePublished
            }
          }
        }
        """#
      ))

    public var query: String
    public var limit: GraphQLNullable<Int>
    public var offset: GraphQLNullable<Int>
    public var ordering: GraphQLNullable<GraphQLEnum<SearchChoicesEnum>>

    public init(
      query: String,
      limit: GraphQLNullable<Int>,
      offset: GraphQLNullable<Int>,
      ordering: GraphQLNullable<GraphQLEnum<SearchChoicesEnum>>
    ) {
      self.query = query
      self.limit = limit
      self.offset = offset
      self.ordering = ordering
    }

    public var __variables: Variables? { [
      "query": query,
      "limit": limit,
      "offset": offset,
      "ordering": ordering
    ] }

    struct Data: GraphQL.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("searchPrints", SearchPrints?.self, arguments: [
          "query": .variable("query"),
          "limit": .variable("limit"),
          "offset": .variable("offset"),
          "ordering": .variable("ordering")
        ]),
      ] }

      var searchPrints: SearchPrints? { __data["searchPrints"] }

      /// SearchPrints
      ///
      /// Parent Type: `ListSearchPrintType`
      struct SearchPrints: GraphQL.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.ListSearchPrintType }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("items", [Item]?.self),
        ] }

        var items: [Item]? { __data["items"] }

        /// SearchPrints.Item
        ///
        /// Parent Type: `SearchPrintType`
        struct Item: GraphQL.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.SearchPrintType }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", GraphQL.ID.self),
            .field("name", String.self),
            .field("image", Image.self),
            .field("nsfw", Bool.self),
            .field("hasModel", Bool.self),
            .field("liked", Bool?.self),
            .field("likesCount", Int.self),
            .field("downloadCount", Int.self),
            .field("datePublished", String.self),
          ] }

          var id: GraphQL.ID { __data["id"] }
          var name: String { __data["name"] }
          var image: Image { __data["image"] }
          var nsfw: Bool { __data["nsfw"] }
          var hasModel: Bool { __data["hasModel"] }
          var liked: Bool? { __data["liked"] }
          var likesCount: Int { __data["likesCount"] }
          var downloadCount: Int { __data["downloadCount"] }
          var datePublished: String { __data["datePublished"] }

          /// SearchPrints.Item.Image
          ///
          /// Parent Type: `PrintImageType`
          struct Image: GraphQL.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.PrintImageType }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("filePath", String.self),
              .field("rotation", Int.self),
            ] }

            var filePath: String { __data["filePath"] }
            var rotation: Int { __data["rotation"] }
          }
        }
      }
    }
  }

}
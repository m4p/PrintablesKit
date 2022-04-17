// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol GraphQL_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GraphQL.SchemaMetadata {}

protocol GraphQL_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GraphQL.SchemaMetadata {}

protocol GraphQL_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GraphQL.SchemaMetadata {}

protocol GraphQL_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GraphQL.SchemaMetadata {}

extension GraphQL {
  typealias ID = String

  typealias SelectionSet = GraphQL_SelectionSet

  typealias InlineFragment = GraphQL_InlineFragment

  typealias MutableSelectionSet = GraphQL_MutableSelectionSet

  typealias MutableInlineFragment = GraphQL_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return GraphQL.Objects.Query
      case "ListSearchPrintType": return GraphQL.Objects.ListSearchPrintType
      case "SearchPrintType": return GraphQL.Objects.SearchPrintType
      case "PrintImageType": return GraphQL.Objects.PrintImageType
      case "PrintType": return GraphQL.Objects.PrintType
      case "UserType": return GraphQL.Objects.UserType
      case "TagType": return GraphQL.Objects.TagType
      case "GCodeType": return GraphQL.Objects.GCodeType
      case "STLType": return GraphQL.Objects.STLType
      case "SLAType": return GraphQL.Objects.SLAType
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}
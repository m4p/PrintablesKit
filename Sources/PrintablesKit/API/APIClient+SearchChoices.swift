public extension APIClient {
    enum SearchOrder {
        case bestMatch
        case latest
        case makesCount
        case rating
        case popular
        
        internal var gqlSearchChoicesEnum: GraphQLNullable<GraphQLEnum<GraphQL.SearchChoicesEnum>> {
            switch self {
            case .bestMatch:
                return nil
            case .latest:
                return GraphQLNullable<GraphQLEnum<GraphQL.SearchChoicesEnum>>(.latest)
            case .makesCount:
                return GraphQLNullable<GraphQLEnum<GraphQL.SearchChoicesEnum>>(.makesCount)
            case .rating:
                return GraphQLNullable<GraphQLEnum<GraphQL.SearchChoicesEnum>>(.rating)
            case .popular:
                return GraphQLNullable<GraphQLEnum<GraphQL.SearchChoicesEnum>>(.popular)
            }
        }
    }
}

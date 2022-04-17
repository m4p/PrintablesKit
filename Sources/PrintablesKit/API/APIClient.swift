import Dependencies
import Foundation
import Apollo

// See https://pointfreeco.github.io/swift-dependencies/main/documentation/dependencies/designingdependencies/

/// API client abstracted as swift-dependencies Dependendy
public struct APIClient {
    public var search: (_ query: String, _ limit: Int, _ offset: Int, _ ordering: SearchOrder) async throws -> [Print]
    public var print: (_ id: String) async throws -> Print
    
    /// Search Printables for a Print
    /// - Parameters:
    ///   - query: Search query
    ///   - limit: Maximum number of results (be reasonable, we don't want to get banned)
    ///   - offset: Offset where to start, for paging
    ///   - ordering: Order of your results
    /// - Returns: Array of results
    public func search(query: String, limit: Int = 10, offset: Int = 0, ordering: SearchOrder = .bestMatch) async throws -> [Print] {
        try await self.search(query, limit, offset, ordering)
    }
    
    /// Get a Print by id
    /// - Parameter id: Identifier of print
    /// - Returns: The Print
    public func print(id: String) async throws -> Print {
        try await self.print(id)
    }
}

extension APIClient: DependencyKey {
    enum APIError: Error {
        case GraphQLError([GraphQLError]?)
    }

    public static let liveValue = Self (
        search: { query, limit, offset, order  in
            let result = try await Network.shared.apollo.fetchFinalResult(query: GraphQL.SearchPrintsQuery(query: query,
                                                                                                           limit: GraphQLNullable<Int>(integerLiteral: limit),
                                                                                                           offset: GraphQLNullable<Int>(integerLiteral: offset),
                                                                                                           ordering: order.gqlSearchChoicesEnum))
            switch result {
            case .success(let response):
                guard let items = response.data?.searchPrints?.items else { return [] }
                return items.map{ Print($0) }
            case .failure(let error):
                throw error
            }
        },
        print: { id in
            let result = try await Network.shared.apollo.fetchFinalResult(query: GraphQL.PrintProfileQuery(id: id))
            switch result {
            case .success(let response):
                guard let item = response.data?.print else { throw APIError.GraphQLError(response.errors) }
                return Print(item)
            case .failure(let error):
                throw error
            }
        }
    )
    
    public static let previewValue = Self (
        search: { _,_,_,_  in [0,1,2,3,4,5,6,7,8,9,10].map{Print.preview($0)} },
        print: { _ in .preview(0) }
    )

    public static let testValue = Self(
        search: { _,_,_,_  in unimplemented("APIClient.search is unimplemented") },
        print: { _ in unimplemented("APIClient.print is unimplemented") }
    )
}

extension DependencyValues {
    public var apiClient: APIClient {
        get { self[APIClient.self] }
        set { self[APIClient.self] = newValue }
    }
}

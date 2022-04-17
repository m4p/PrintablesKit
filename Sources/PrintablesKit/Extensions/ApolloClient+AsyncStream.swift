import Apollo
import Foundation

extension ApolloClient {
    public func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .default,
        contextIdentifier: UUID? = nil,
        queue: DispatchQueue = .main
    ) -> AsyncThrowingStream<GraphQLResult<Query.Data>, Error> {
        AsyncThrowingStream { continuation in
            let request = fetch(
                query: query,
                cachePolicy: cachePolicy,
                contextIdentifier: contextIdentifier,
                queue: queue
            ) { response in
                switch response {
                case .success(let result):
                    continuation.yield(result)
                    if result.isFinalForCachePolicy(cachePolicy) {
                        continuation.finish()
                    }
                case .failure(let error):
                    continuation.finish(throwing: error)
                }
            }
            continuation.onTermination = { @Sendable _ in
                request.cancel()
            }
        }
    }
    
    public func fetchFinalResult<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .default,
        contextIdentifier: UUID? = nil,
        queue: DispatchQueue = .main
    ) async throws -> Result<GraphQLResult<Query.Data>, Error> {
        var result: GraphQLResult<Query.Data>? = nil
        for try await response in fetch(query: query,
                                        cachePolicy: cachePolicy,
                                        contextIdentifier: contextIdentifier,
                                        queue: queue) { result = response }
        return .success(result!)
    }
    
    public func watch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .default,
        callbackQueue: DispatchQueue = .main
    ) -> AsyncThrowingStream<GraphQLResult<Query.Data>, Error> {
        AsyncThrowingStream { continuation in
            let watch = watch(query: query, cachePolicy: cachePolicy, callbackQueue: callbackQueue) { result in
                switch result {
                case .success(let result):
                    continuation.yield(result)
                case .failure(let error):
                    continuation.finish(throwing: error)
                }
            }
            continuation.onTermination = { @Sendable _ in
                watch.cancel()
            }
        }
    }
    
    public func perform<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool = true,
        queue: DispatchQueue = .main
    ) async throws -> GraphQLResult<Mutation.Data> {
        try await withCheckedThrowingContinuation { continuation in
            perform(mutation: mutation, publishResultToStore: publishResultToStore, queue: queue) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    public func upload<Operation: GraphQLOperation>(
        operation: Operation,
        files: [GraphQLFile],
        queue: DispatchQueue = .main
    ) async throws -> GraphQLResult<Operation.Data> {
        try await withCheckedThrowingContinuation { continuation in
            upload(operation: operation, files: files, queue: queue) { result in
                continuation.resume(with: result)
            }
        }
    }
}

fileprivate extension GraphQLResult {
    func isFinalForCachePolicy(_ cachePolicy: CachePolicy) -> Bool {
        switch cachePolicy {
        case .returnCacheDataAndFetch:
            return source == .server
        default:
            return true
        }
    }
}

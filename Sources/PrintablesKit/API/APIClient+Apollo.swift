import Foundation
import Apollo

extension APIClient {
    public class Network {
        class NetworkInterceptorProvider: DefaultInterceptorProvider {
            class CustomInterceptor: ApolloInterceptor {
                func interceptAsync<Operation: GraphQLOperation>(
                    chain: RequestChain,
                    request: HTTPRequest<Operation>,
                    response: HTTPResponse<Operation>?,
                    completion: @escaping (Swift.Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
                        //request.addHeader(name: "x-header", value: "true")
                        chain.proceedAsync(request: request,
                                           response: response,
                                           completion: completion)
                    }
            }
            override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
                var interceptors = super.interceptors(for: operation)
                interceptors.insert(CustomInterceptor(), at: 0)
                return interceptors
            }
        }
        
        static let shared = Network()
        
        public private(set) lazy var apollo: ApolloClient = {
            let client = URLSessionClient()
            let cache = InMemoryNormalizedCache()
            let store = ApolloStore(cache: cache)
            let provider = NetworkInterceptorProvider(client: client, store: store)
            let url = Constants.apiBaseURL
            let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
            return ApolloClient(networkTransport: transport, store: store)
        }()
    }
}

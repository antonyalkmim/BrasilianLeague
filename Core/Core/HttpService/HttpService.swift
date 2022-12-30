//
//  HttpService.swift
//  Core
//
//  Created by antony.alkmim on 30/12/22.
//

import Foundation

public struct Endpoint {
    /// API host
    public var baseURL: String = "https://private-3bdfee-brasilianleague.apiary-mock.com"
    /// endpoint path
    public var path: String
    /// HTTP method
    public var method: HttpMethod
    /// HTTP json body
    public var body: Encodable?
    /// HTTP headers
    public var headers: [String: String] = [:]

    public init(
        baseURL: String = "https://private-3bdfee-brasilianleague.apiary-mock.com",
        path: String,
        method: HttpMethod = .get,
        body: Encodable? = nil,
        headers: [String: String] = [:]
    ) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.body = body
        self.headers = headers
    }

    public func urlRequest() -> URLRequest {

        // generate url
        let pathComponents = path.split(separator: "?")
        let pathQueries = pathComponents
            .dropFirst()
            .joined(separator: "?")
            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let pathFormatted = String(pathComponents.first ?? "")
            .appending("?")
            .appending(pathQueries ?? "")

        guard let url = URLComponents(string: "\(baseURL)\(pathFormatted)")?.url else {
            fatalError("invalid URL")
        }

        var request = URLRequest(url: url)

        /// http method
        request.httpMethod = self.method.rawValue

        /// request body
        request.httpBody = body?.encodeToAPI()

        /// headers
        self.headers.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }

        return request
    }
}

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public class HttpService {

    /// closure executed before request
    public typealias RequestClosure = (Endpoint) -> URLRequest

    /// closure executed after response
    public typealias ResponseClosure = (HTTPURLResponse?, Data?) -> Void

    var requestClosure: RequestClosure
    var responseClosure: ResponseClosure
    private let session: URLSession

    // MARK: - Initializer
    public init(
        urlSession: URLSession? = nil,
        requestClosure: @escaping RequestClosure = { $0.urlRequest() },
        responseClosure: @escaping ResponseClosure = { _, _ in }
    ) {

        self.session = urlSession ?? URLSession(
            configuration: URLSessionConfiguration.default,
            delegate: nil,
            delegateQueue: nil
        )
        self.requestClosure = requestClosure
        self.responseClosure = responseClosure
    }

    @discardableResult
    public func request<Response: Decodable>(_ endpoint: Endpoint) async throws -> Response {

        // 1 - pass through interceptors
        let request = requestClosure(endpoint)

        // 2 - reachability
        if !Reachability.isConnectedToNetwork {
            throw NetworkError.noInternetConnection
        }

        // 3 - Exec request
        let (data, response) = try await session.data(for: request)

        guard let httpURLResponse = response as? HTTPURLResponse else {
            throw NetworkError.connectionError
        }

        // 4 - run interceptors for response
        responseClosure(httpURLResponse, data)

        // 5 - decode api payload data
        let decodedResponse: Response = try data.decodeFromAPI()

        return decodedResponse
    }

}

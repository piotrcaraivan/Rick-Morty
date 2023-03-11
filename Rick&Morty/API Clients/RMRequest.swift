//
//  RMRequest.swift
//  Rick&Morty
//
//  Created by Петр Караиван on 10.03.2023.
//

import Foundation

/// Объект, представляющий одиночный вызов API
final class RMRequest {
    /// API Constant
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Конечная точка
    private let endpoint: RMEndpoint
    
    /// Компоненты пути для АПИ
    private let pathComponents: Set<String>
    
    /// Запросы
    private let quaryParameters: [URLQueryItem]
    
    /// Constructed url for the api  request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !quaryParameters.isEmpty {
            string += "?"
            let argumentString = quaryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Вычисленный и сконструированный адрес API
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// HTTP Method
    public let  httpMethod = "GET"
    
    // MARK: - Public
    
    /// Запрос
    /// - Parameters:
    ///   - endpoint: Endpoint
    ///   - pathComponents: Collection path
    ///   - quaryParameters: Collection of quary
    public init(
        endpoint: RMEndpoint,
        pathComponents: Set<String> = [],
        quaryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.quaryParameters = quaryParameters
    }
}

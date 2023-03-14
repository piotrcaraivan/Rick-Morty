//
//  RMService.swift
//  Rick&Morty
//
//  Created by Петр Караиван on 10.03.2023.
//

import Foundation


/// Основной объект службы API для получения данных Рика и Морти
final class RMService {
    /// Общий одиночный экземпляр
    static let shared = RMService()
    
    /// Приватный конструктор
    private init() {}
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Отправь Рику и Морти API Call
    /// - Parameters:
    ///   - request: экземпляр запроса
    ///   - type: тот тип объекта, который мы ожидаем получить обратно
    ///   - completion: Обратный вызов с данными или ошибкой
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting  type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
                return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            // Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    // MARK: - private
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}

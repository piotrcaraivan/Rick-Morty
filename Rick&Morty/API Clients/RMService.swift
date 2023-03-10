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
    
    /// Отправь Рику и Морти API Call
    /// - Parameters:
    ///   - request: экземпляр запроса
    ///   - completion: Обратный вызов с данными или ошибкой
    public func execute(_ request: RMService, completion: @escaping () -> Void) {
        
    }
}

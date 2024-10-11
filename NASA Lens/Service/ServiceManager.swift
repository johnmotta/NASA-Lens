//
//  ServiceManager.swift
//  NASA Lens
//
//  Created by John Motta on 10/10/24.
//

import Foundation

protocol NEOServiceProtocol {
    func fetchData(completion: @escaping (Result<[MarsRoverPhoto], NetworkError>) -> Void)
    func fetchNEOData(startDate: String, endDate: String, completion: @escaping (Result<NEOResponse, NetworkError>) -> Void)
}

class ServiceManager: NEOServiceProtocol {
    static let shared = ServiceManager()
    
    func fetchData(completion: @escaping (Result<[MarsRoverPhoto], NetworkError>) -> Void) {
        let urlString = "\(Constants.baseURL)mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=\(Constants.API)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL(urlString)))
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, _, error in
            if let error {
                completion(.failure(.networkFailure(error)))
                return
            }
            
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                let response = try decoder.decode(MarsRoverPhotosResponse.self, from: data)
                completion(.success(response.photos))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        task.resume()
    }
        
    func fetchNEOData(startDate: String, endDate: String, completion: @escaping (Result<NEOResponse, NetworkError>) -> Void) {
        let baseURL = "https://api.nasa.gov/neo/rest/v1/feed"
        let apiKey = Constants.API
        guard var urlComponents = URLComponents(string: baseURL) else {
            completion(.failure(.invalidURL(baseURL)))
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "start_date", value: startDate),
            URLQueryItem(name: "end_date", value: endDate),
            URLQueryItem(name: "api_key", value: apiKey)
        ]
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidURL(baseURL)))
            return
        }
                
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(.networkFailure(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.networkFailure(NSError(domain: "Invalid response", code: 0, userInfo: nil))))
                return
            }
            
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.apiError(httpResponse.statusCode, "API Error")))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let neoResponse = try decoder.decode(NEOResponse.self, from: data)
                completion(.success(neoResponse))
            } catch {
                print("Decoding error: \(error.localizedDescription)")
                if let decodingError = error as? DecodingError {
                    print("Decoding Error Details: \(decodingError)")
                }
                completion(.failure(.decodingError(error)))
            }
        }
        task.resume()
    }
}

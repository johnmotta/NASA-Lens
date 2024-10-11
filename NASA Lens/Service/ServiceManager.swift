//
//  ServiceManager.swift
//  NASA Lens
//
//  Created by John Motta on 10/10/24.
//

import Foundation

class ServiceManager {
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
    
    func fetchAsteroids(for date: Date? = nil, completion: @escaping (Result<[Asteroid], NetworkError>) -> Void) {
        var urlString = "\(Constants.API)neo/rest/v1/feed?api_key=\(Constants.API)"
        
        if let date = date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            let dateString = dateFormatter.string(from: date)
            urlString += "&start_date=\(dateString)&end_date=\(dateString)"
        }
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL(urlString)))
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
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
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode([Asteroid].self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        task.resume()
    }
}

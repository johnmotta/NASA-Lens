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
        let urlString = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=\(Constants.API)"

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
                print("Fotos recebidas: \(response.photos.count)")
                completion(.success(response.photos))
            } catch {
                print("Erro ao decodificar dados: \(error)")
                completion(.failure(.decodingError(error)))
            }

        }
        task.resume()
    }
}

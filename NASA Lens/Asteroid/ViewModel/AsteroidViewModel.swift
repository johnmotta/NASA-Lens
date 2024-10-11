//
//  AsteroidViewModel.swift
//  NASA Lens
//
//  Created by John Motta on 11/10/24.
//

import Foundation

class AsteroidViewModel {
    var asteroids: [String: [NearEarthObject]] = [:]
        
    func fetchData(startDate: String, endDate: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        ServiceManager.shared.fetchNEOData(startDate: startDate, endDate: endDate) { [weak self] result in
            switch result {
            case .success(let neoResponse):
                self?.asteroids = neoResponse.nearEarthObjects
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getAsteroidsSortedByDate() -> [(date: String, asteroids: [NearEarthObject])] {
        let sorted = asteroids.sorted { $0.key < $1.key }.map { (date: $0.key, asteroids: $0.value) }
        return sorted
    }
    
    func getAsteroidCount() -> Int {
        let count = asteroids.values.reduce(0) { $0 + $1.count }
        return count
    }
}

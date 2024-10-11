//
//  Asteroid.swift
//  NASA Lens
//
//  Created by John Motta on 11/10/24.
//

import Foundation

struct Asteroid: Codable, Identifiable {
    let id: String
    let name: String
    let estimatedDiameter: Double
    let isPotentiallyHazardousAsteroid: Bool
    let closeApproachDate: Date
    let relativeVelocity: Double
    let missDistance: Double
    let orbitingBody: String
}

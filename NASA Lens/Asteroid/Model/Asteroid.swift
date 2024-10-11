//
//  Asteroid.swift
//  NASA Lens
//
//  Created by John Motta on 11/10/24.
//

import Foundation

struct NEOResponse: Codable {
    let links: Links
    let elementCount: Int
    let nearEarthObjects: [String: [NearEarthObject]]
    
    enum CodingKeys: String, CodingKey {
        case links
        case elementCount = "element_count"
        case nearEarthObjects = "near_earth_objects"
    }
}

struct Links: Codable {
    let next: String
    let prev: String?
    let selfLink: String
    
    enum CodingKeys: String, CodingKey {
        case next
        case prev
        case selfLink = "self"
    }
}

struct NearEarthObject: Codable {
    let id: String
    let neoReferenceId: String
    let name: String
    let nasaJplUrl: String
    let absoluteMagnitudeH: Double
    let estimatedDiameter: EstimatedDiameter
    let isPotentiallyHazardousAsteroid: Bool
    let closeApproachData: [CloseApproachData]
    
    enum CodingKeys: String, CodingKey {
        case id
        case neoReferenceId = "neo_reference_id"
        case name
        case nasaJplUrl = "nasa_jpl_url"
        case absoluteMagnitudeH = "absolute_magnitude_h"
        case estimatedDiameter = "estimated_diameter"
        case isPotentiallyHazardousAsteroid = "is_potentially_hazardous_asteroid"
        case closeApproachData = "close_approach_data"
    }
}


struct EstimatedDiameter: Codable {
    let kilometers: DiameterRange
    let meters: DiameterRange
    let miles: DiameterRange
    let feet: DiameterRange
}

struct DiameterRange: Codable {
    let estimatedDiameterMin: Double
    let estimatedDiameterMax: Double
    
    enum CodingKeys: String, CodingKey {
        case estimatedDiameterMin = "estimated_diameter_min"
        case estimatedDiameterMax = "estimated_diameter_max"
    }
}

struct CloseApproachData: Codable {
    let closeApproachDate: String
    let closeApproachDateFull: String
    let epochDateCloseApproach: Int64
    let relativeVelocity: RelativeVelocity
    let missDistance: MissDistance
    let orbitingBody: String
    
    enum CodingKeys: String, CodingKey {
        case closeApproachDate = "close_approach_date"
        case closeApproachDateFull = "close_approach_date_full"
        case epochDateCloseApproach = "epoch_date_close_approach"
        case relativeVelocity = "relative_velocity"
        case missDistance = "miss_distance"
        case orbitingBody = "orbiting_body"
    }
}

struct RelativeVelocity: Codable {
    let kilometersPerSecond: String
    let kilometersPerHour: String
    let milesPerHour: String
    
    enum CodingKeys: String, CodingKey {
        case kilometersPerSecond = "kilometers_per_second"
        case kilometersPerHour = "kilometers_per_hour"
        case milesPerHour = "miles_per_hour"
    }
}

struct MissDistance: Codable {
    let astronomical: String
    let lunar: String
    let kilometers: String
    let miles: String
}

//
//  MarsRoverPhoto.swift
//  NASA Lens
//
//  Created by John Motta on 10/10/24.
//

struct MarsRoverPhotosResponse: Decodable {
    let photos: [MarsRoverPhoto]
}

struct MarsRoverPhoto: Decodable {
    let id: Int
    let imgSrc: String
    let earthDate: String
    let rover: Rover
    let camera: Camera

    enum CodingKeys: String, CodingKey {
        case id
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
        case camera
    }
}

struct Rover: Decodable {
    let id: Int
    let name: String
    let landingDate: String
    let launchDate: String
    let status: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }
}

struct Camera: Decodable {
    let id: Int
    let name: String
    let roverID: Int
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}

//
//  Apod.swift
//  NASA Lens
//
//  Created by John Motta on 13/10/24.
//

import Foundation

struct Apod: Codable {
    let copyright: String?
    let date: String
    let explanation: String
    let mediaType: String
    let serviceVersion: String
    let title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case copyright
        case date
        case explanation
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title
        case url
    }
}

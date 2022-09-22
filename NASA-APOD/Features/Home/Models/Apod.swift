//
//  Apod.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

struct Apod: Codable {
    let date, explanation: String
    let hdurl: String
    let mediaType, serviceVersion, title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}

//
//  Model.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 11/05/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let airports = try? JSONDecoder().decode(Airports.self, from: jsonData)

import Foundation


// MARK: - Airport
struct Airport: Codable {
    let longitudeDeg: String
    let otherName: String?
    let iataCode, elevationFt: String
    let isAvailable: Bool
    let localCode: String?
    let id: Int
    let continent: String
    let countryID: Int
    let ident: String
    let homeLink: String
    let isoCountry, typeA: String
    let wikipediaLink: String
    let isoRegion, name, keywords, municipality: String
    let latitudeDege: String
    let code: String?
    let scheduledService, gpsCode: String

    enum CodingKeys: String, CodingKey {
        case longitudeDeg = "longitude_deg"
        case otherName = "other_name"
        case iataCode = "iata_code"
        case elevationFt = "elevation_ft"
        case isAvailable = "is_available"
        case localCode = "local_code"
        case id, continent
        case countryID = "country_id"
        case ident
        case homeLink = "home_link"
        case isoCountry = "iso_country"
        case typeA
        case wikipediaLink = "wikipedia_link"
        case isoRegion = "iso_region"
        case name, keywords, municipality
        case latitudeDege = "latitude_dege"
        case code
        case scheduledService = "scheduled_service"
        case gpsCode = "gps_code"
    }
}

typealias Airports = [Airport]

//// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

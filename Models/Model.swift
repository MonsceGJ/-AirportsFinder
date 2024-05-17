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
    struct Airport: Codable, Hashable {
        let longitudeDeg: String
        let otherName: String?
        let iataCode, elevationFt: String?
        let isAvailable: Bool
        let localCode: String?
        let id: Int
        let continent: Continent
        let countryID: Int
        let ident: String
        let homeLink: String?
        let isoCountry: ISOCountry
        let typeA: TypeA
        let wikipediaLink: String?
        let isoRegion: ISORegion
        let name: String
        let keywords: String?
        let municipality: String?
        let latitudeDege: String
        let code: String?
        let scheduledService: ScheduledService
        let gpsCode: String?

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

    enum Continent: String, Codable {
        case eu = "EU"
    }

    enum ISOCountry: String, Codable {
        case be = "BE"
    }

    enum ISORegion: String, Codable {
        case beBru = "BE-BRU"
        case beVan = "BE-VAN"
        case beVbr = "BE-VBR"
        case beVli = "BE-VLI"
        case beVov = "BE-VOV"
        case beVwv = "BE-VWV"
        case beWbr = "BE-WBR"
        case beWht = "BE-WHT"
        case beWlg = "BE-WLG"
        case beWlx = "BE-WLX"
        case beWna = "BE-WNA"
    }

    enum ScheduledService: String, Codable {
        case no = "no"
        case yes = "yes"
    }

    enum TypeA: String, Codable {
        case balloonport = "balloonport"
        case closed = "closed"
        case heliport = "heliport"
        case largeAirport = "large_airport"
        case mediumAirport = "medium_airport"
        case seaplaneBase = "seaplane_base"
        case smallAirport = "small_airport"
    }

    typealias Airports = [Airport]

    

    

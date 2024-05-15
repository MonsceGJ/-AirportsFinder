//
//  viewModel.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 11/05/24.
//


import Foundation
import Combine 

class AirportViewModel: ObservableObject {
    let apiClient: APIClient
    
    @Published var airports: [Airport] = []
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func searchAirports(forCountry countryCode: String) {
        apiClient.fetchData { result in
            switch result {
            case .success(let airports):
                
                let filteredAirports = airports.filter { $0.isoCountry == countryCode }
                if filteredAirports.isEmpty {
                   
                    print("No se encontraron aeropuertos para el país con el código: \(countryCode)")
                } else {
                  
                    print("Aeropuertos encontrados para el país con el código \(countryCode): \(filteredAirports)")
                }
            case .failure(let error):
             
                print("Error al obtener aeropuertos: \(error)")
            }
        }
    }

}


//
//  viewModel.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 11/05/24.
//


import Foundation


class AirportViewModel: ObservableObject {
    @Published var airports2: [Airport]?
    @Published var error: Error?
    
    private let apiClient = APIClient()
    
    func fetchAirports(Country: String) {
        apiClient.fetchData(country: Country) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let airports):
                    self.airports2 = airports
                    print("Results \(airports)")
                case .failure(let error):
                    print("Error fetching airports: \(error)")
                }
            }
        }
    }
}










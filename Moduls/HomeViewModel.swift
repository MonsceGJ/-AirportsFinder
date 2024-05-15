//
//  viewModel.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 11/05/24.
//

import Foundation
import SwiftUI


//protocol SearchRepositoryProtocol {
//    func search(whiRadius radius: Double) -> [String]
//}
//
//class searchRepository: SearchRepositoryProtocol{
//    func search(whiRadius radius: Double) -> [String] {
//        return[""]
//    }
//}
//
//class FirstScreenViewModel: ObservableObject {
//    @Published var searchRadius: Double
//     let searchRepository: SearchRepositoryProtocol
//    
//    init(searchRepository: SearchRepositoryProtocol) {
//        self.searchRadius = 10 // Valor por defecto
//        self.searchRepository = searchRepository
//    }
//}

// Patron de diseño "Repository Pattern"

import Foundation
class AirportViewModel: ObservableObject {
    private let apiClient: APIClient
    
    @Published var airports: [Airport] = []
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchData(forCountry country: String) {
       
        apiClient.fetchData()
    }
}



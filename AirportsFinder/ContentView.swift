//
//  ContentView.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 11/05/24.
//

import SwiftUI



struct ContentView: View {
   
    @StateObject var airportViewModel = AirportViewModel(apiClient: APIClient())
    
    var body: some View {
        NavigationView {
            AirportListView(viewModel: airportViewModel)
                .navigationTitle("Buscar Aeropuertos")
        }
    }
}
